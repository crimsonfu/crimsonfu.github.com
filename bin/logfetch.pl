#!/usr/bin/env perl
# fetch IRC logs for safekeeping
use strict;
use warnings;
# based on http://search.cpan.org/perldoc?HTML::Tree::Scanning
use HTML::TreeBuilder;
use LWP::Simple;
use Readonly;
use Carp;
use English '-no_match_vars';
#use Smart::Comments;

# http://irclog.perlgeek.de/text.pl?channel=crimsonfu;date=2012-02-08
Readonly my $BASE_URL        => 'http://irclog.perlgeek.de';
Readonly my $CHANNEL_NAME    => 'crimsonfu';
Readonly my $INDEX_URL       => "$BASE_URL/$CHANNEL_NAME";
Readonly my $LOG_DIR         => 'irclogs';
Readonly my $SLEEP_INTERVAL  => .5;
Readonly my $EXPECTED_IN_CWD => '_config.yml';

#my $file = '/tmp/index.html';
#my $index_tree = HTML::TreeBuilder->new->parse_file($file);

croak "Please cd to root of repo. Couldn't find $EXPECTED_IN_CWD: $OS_ERROR"
  unless -f $EXPECTED_IN_CWD;

# NB: not Y3K compliant
my @local_logs = glob("$LOG_DIR/2*");
s{^$LOG_DIR/}{}g foreach @local_logs;
s{\.html$}{}g    foreach @local_logs;
my $newish_local_log = $local_logs[-3];

my $index_content = get $INDEX_URL
  or croak "Couldn't download index page: $OS_ERROR";
my $index_tree = HTML::TreeBuilder->new->parse($index_content)->eof;

my @dates_with_activity = get_dates_with_activity();
## @dates_with_activity;

my $index_page = build_index_page(@dates_with_activity);
## $index_page;

mkdir $LOG_DIR unless -d $LOG_DIR;

open my $fh, '>', "$LOG_DIR/index.md" or croak $OS_ERROR;
print {$fh} $index_page;
close $fh or croak $OS_ERROR;

for my $date (@dates_with_activity) {

    # skip dates for logs we already have
    next if $date lt $newish_local_log;

    #print "$date is greater than $newish_local_log\n";

    #print $date, "\n";
    my $chat_content = get "$BASE_URL/text.pl?channel=$CHANNEL_NAME;date=$date"
      or croak "Couldn't download chat content for $date: $OS_ERROR";
    #print $chat_content, "\n";
    open my $fh, '>:encoding(UTF-8)', "$LOG_DIR/$date.html" or croak $OS_ERROR;
    print {$fh} $chat_content;
    close $fh or croak $OS_ERROR;
    sleep $SLEEP_INTERVAL;
}

sub build_index_page {
    my @dates = @_;
    my $page  = "---\nlayout: default\ntitle: IRC logs\n---\n";
    for my $date (@dates) {
        $page .= "* [$date]($date.html)\n";
    }
    return $page;
}

sub get_dates_with_activity {
    my @dates;
    for my $date_with_activity ( $index_tree->look_down( class => 'calendars' )->look_down( _tag => 'a' ) ) {
        my $href = $date_with_activity->attr('href');
        my ($date_only) = $href =~ m{^/$CHANNEL_NAME/(\d\d\d\d-\d\d-\d\d)$}sm;
        push @dates, $date_only;
    }
    my @dates_sorted = sort @dates;
    return @dates_sorted;
}

$index_tree->delete();
