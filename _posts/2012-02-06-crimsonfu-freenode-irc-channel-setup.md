---
title: crimsonfu freenode IRC channel setup
layout: post
author: pdurbin
---
Since crimsonfu abides by the principle "[when in doubt, make it public](/2012/01/30/introducing-crimsonfu.html)," we decided to make a [publicly-logged IRC channel](http://irclog.perlgeek.de/crimsonfu/) our primary means of communication.

This post will describe the IRC commands used to set up #crimsonfu on freenode.  Generally speaking, we followed http://blog.freenode.net/2008/04/registering-a-channel-on-freenode/ but logging was set up separately.  Spam prevention is discussed as well.

## Setting up #crimsonfu on freenode

Note: Commands are show being sent from the `[(status)]` prompt of [irssi](http://irssi.org).)

First, we check to see if the channel is already in use:

    [(status)] /msg ChanServ info #crimsonfu
    19:18 -!- Irssi: Starting query in freenode with ChanServ
    19:18 <pdurbin> info #crimsonfu
    19:18 -ChanServ(ChanServ@services.)- Channel #crimsonfu is not registered.

It wasn't, so we join the channel:

    [(status)] /join #crimsonfu
    19:18 -!- ServerMode/#crimsonfu [+ns] by niven.freenode.net
    19:18 [Users #crimsonfu]
    19:18 [@pdurbin] 
    19:18 -!- Irssi: #crimsonfu: Total of 1 nicks [1 ops, 0 halfops, 0 voices, 0 
              normal]
    19:18 -!- Channel #crimsonfu created Tue Jan 17 19:18:21 2012
    19:18 -!- Irssi: Join to #crimsonfu was synced in 0 secs

Next, we examine the default modes for our newly-created channel on freenode:

    [(status)] /mode #crimsonfu
    19:18 -!- mode/#crimsonfu [+ns]
    19:18 -!- Channel #crimsonfu created Tue Jan 17 19:18:21 2012

Modes are explained at http://freenode.net/using_the_network.shtml

* +n (prevent external send)
  * Users outside the channel may not send messages to it.
* +s (secret channel)
  * This channel will not appear on channel lists or WHO or WHOIS output unless you are on it. 

Let's get some info on the channel:

    [(status)] /msg ChanServ info #crimsonfu
    19:21 <pdurbin> info #crimsonfu
    19:21 -ChanServ(ChanServ@services.)- Channel #crimsonfu is not registered.

There's not much to see.  Let's register the channel:

    [(status)] /msg ChanServ register #crimsonfu
    19:22 <pdurbin> register #crimsonfu
    19:22 -ChanServ(ChanServ@services.)- You are not logged in.

Whoops! ChanServe doesn't know who we are.  Only [registered and identified](http://freenode.net/faq.shtml#nicksetup) nicks can register a channel:

    [(status)] /msg nickserv identify myPassword
    19:22 -!- Irssi: Starting query in freenode with nickserv
    19:22 <pdurbin> identify myPassword
    19:22 -NickServ(NickServ@services.)- You are now identified for pdurbin.

Ok, now we register the channel for reals:

    [(status)] /msg ChanServ register #crimsonfu
    19:24 <pdurbin> register #crimsonfu
    19:24 -ChanServ(ChanServ@services.)- #crimsonfu is now registered to pdurbin.
    19:24 -ChanServ(ChanServ@services.)-  
    19:24 -ChanServ(ChanServ@services.)- Channel guidelines can be found on the 
              freenode website
    19:24 -ChanServ(ChanServ@services.)- 
              (http://freenode.net/channel_guidelines.shtml).
    19:24 -ChanServ(ChanServ@services.)- freenode is a service of Peer-Directed 
              Projects Center, a
    19:24 -ChanServ(ChanServ@services.)- not-for-profit organisation registered in 
              England and Wales.
    19:24 -ChanServ(ChanServ@services.)- This is a primary namespace channel as per
    19:24 -ChanServ(ChanServ@services.)- 
              http://freenode.net/policy.shtml#primarychannels
    19:24 -!- mode/#crimsonfu [-s+tc] by ChanServ

That's interesting.  The mode changed.  Let's look at that again:

    [(status)] /mode #crimsonfu
    19:24 -!- mode/#crimsonfu [+cnt]
    19:24 -!- Channel #crimsonfu created Fri Dec 16 09:18:56 2011

Here are the modes now that the channel has been registered:

* +c (color filter)
  * This mode activates the colour filter for the channel. This filters out bold, underline, reverse video, beeps, mIRC colour codes, and ANSI escapes. Note that escape sequences will usually leave cruft sent to the channel, just without the escape characters themselves.
* +n (prevent external send)
  * Users outside the channel may not send messages to it.
* +t (only ops can change topic)
  * When +t is set, only channel operators may modify the topic of the channel. This mode is recommended in larger, more public channels to protect the integrity of the topic.

Ok, let's try getting some info about our channel:

    [(status)] /msg ChanServ info #crimsonfu
    19:25 <pdurbin> info #crimsonfu
    19:25 -ChanServ(ChanServ@services.)- Information on #crimsonfu:
    19:25 -ChanServ(ChanServ@services.)- Founder    : pdurbin
    19:25 -ChanServ(ChanServ@services.)- Registered : Jan 17 19:24:53 2012
    19:25 -ChanServ(ChanServ@services.)- Mode lock  : +ntc-slk
    19:25 -ChanServ(ChanServ@services.)- *** End of Info ***

That "mode lock" line is interesting.  We saw above how +s (secret channel) was taken away when we registered the channel.  Here's what -l and -k mean:

* -l (join limit)
  * Specified with a numeric value, this mode limits the number of users who can join your channel. 
* -k (channel password)
  * This mode sets up a channel password. To enter the channel, you must specify the password on your JOIN command. Keep in mind, modes locked with ChanServ's MLOCK command can be seen by anyone recreating the channel (this includes keys).

Next, we set our topic.  First, we confirm that no topic has been set:

    [(status)] /topic #crimsonfu
    19:25 -!- No topic set for #crimsonfu

Then, we set it with the following command:

    [(status)] /topic #crimsonfu crimsonfu: ConfiguRatIon Management of Systems Or Network kung FU
    19:25 -!- pdurbin changed the topic of #crimsonfu to: crimsonfu: ConfiguRatIon Management of Systems Or Network kung FU

## Setting up logging for #crimsonfu

Next, we set up logging for the channel.  Moritz Lenz, "moritz" on freenode, posted about [an offer for software developers: free IRC logging](http://perlgeek.de/blog-en/perl-6/an-offer-to-the-perl-community.html) and we took him up on it. His [ilbot](http://moritz.faui2k3.org/en/ilbot) [joined](http://irclog.perlgeek.de/crimsonfu/2012-01-17#i_5004609) our channel, and per his suggestion, we changed the topic to alert participants that the channel is being logged. 

    [(status)] /topic #crimsonfu crimsonfu: ConfiguRatIon Management of Systems Or Network kung FU | logs at http://irclog.perlgeek.de/crimsonfu/today
    19:31 -!- pdurbin changed the topic of #crimsonfu to: crimsonfu: ConfiguRatIon Management of Systems Or Network kung FU | logs at http://irclog.perlgeek.de/crimsonfu/today

## Fighting spam in #crimsonfu

Days passed and we started using the channel.  We [briefly discussed](http://irclog.perlgeek.de/crimsonfu/2012-01-26#i_5055415) that because the channel is being logged and there is nothing to prevent anyone from joining the channel, we are vulnerable to attack by spammers.  Switching to mode +i is suggested:

    15:50 pdurbin  sorry to get meta, but one of my concerns is that spammers will jump in this irc channel and fill our logs ( http://irclog.perlgeek.de/crimsonfu ) with spam :(
    15:50 pdurbin  it's for this reason that i haven't mentioned the irc channel at http://crimsonfu.github.com yet
    15:53 whorka   I think you can set invite-only with /mode #crimsonfu +i

Here is what +i means:

* +i (invite-only)
  * No client can join this channel unless they are listed in the invite exemption list (+I) or are invited by someone through the /invite command.

Wikipedia has a [great article](http://en.wikipedia.org/wiki/Wikipedia:IRC/Channel_access_and_configuration_guide) on +i mode, but after a conversation (below) with Moritz Lenz, the developer of the IRC bot that logs our channel, we discovered a few things:

* support for +i is untested with the logging bot
* an admin interface for deleting spam could be enabled
* spam typically isn't a big problem on freenode anyway

As such, for now, we're not going to use +i mode.  Here is the conversation with Mortiz, published with his permission:

    -------- Original Message --------
    Subject: ilbot and +i (invite-only) mode on freenode
    Date: Sun, 05 Feb 2012 18:07:01 -0500
    From: Philip Durbin
    To: Moritz Lenz

    Hello!  Thank you so much for setting up logging for #docjekyll and 
    #crimsonfu on freenode!  My team members and I are thrilled.

    One of my concerns, however, is spam.  Here is our brief discussion 
    about it from http://irclog.perlgeek.de/crimsonfu/2012-01-26#i_5055415

    15:50 pdurbin  sorry to get meta, but one of my concerns is that 
    spammers will jump in this irc channel and fill our logs ( 
    http://irclog.perlgeek.de/crimsonfu ) with spam :(
    15:50 pdurbin  it's for this reason that i haven't mentioned the irc 
    channel at http://crimsonfu.github.com yet
    15:53 whorka   I think you can set invite-only with /mode #crimsonfu +i

    Before I spend too much time on figuring this +i (invite-only) mode on 
    freenode (I'm very new to IRC but I'm reading up on it), I wanted to 
    check with you if this will work with ilbot.  That is to say, if I 
    change my channel to +i will ilbot continue to log and work, provided I 
    figure out how to invite it?

    Sorry for these basic questions.  As I said, I'm new to IRC.  Thanks 
    again for providing this great service!

    Thanks,

    Phil

    =====

    -------- Original Message --------
    Subject: Re: ilbot and +i (invite-only) mode on freenode
    Date: Mon, 06 Feb 2012 06:39:49 +0100
    From: Moritz Lenz
    To: Philip Durbin

    Hi Phil,

    usually spam isn't much of a problem on freenode, the staff is very good
    at banning spammers. At least that's my experience from over 4 years of
    logging #perl6, a channel we advertise everywhere on the web.

    On 02/06/2012 12:07 AM, Philip Durbin wrote:
    > Before I spend too much time on figuring this +i (invite-only) mode on 
    > freenode (I'm very new to IRC but I'm reading up on it), I wanted to 
    > check with you if this will work with ilbot.  That is to say, if I 
    > change my channel to +i will ilbot continue to log and work, provided I 
    > figure out how to invite it?

    I have no idea if it will work; it's not explicitly written to do that,
    and I have never tested it.

    My advice is to deal with spam if and when it appears.

    Cheers,
    Moritz

    =====

    -------- Original Message --------
    Subject: Re: ilbot and +i (invite-only) mode on freenode
    Date: Mon, 06 Feb 2012 08:11:17 -0500
    From: Philip Durbin
    To: Moritz Lenz

    On 02/06/2012 12:39 AM, Moritz Lenz wrote:
    > usually spam isn't much of a problem on freenode, the staff is very good
    > at banning spammers. At least that's my experience from over 4 years of
    > logging #perl6, a channel we advertise everywhere on the web.

    That's great to hear.  I do hope that spammers don't become a problem in 
    my channel.

    In addition to relying on freenode staffers to help fight spammers, I 
    plan to figure out how to give other members of my team the ability to 
    kick and ban spammers.  I tried giving them OP with this. . .

    /msg ChanServ OP #crimsonfu shuff

    . . . but I found that as soon as shuff left the channel and re-entered, 
    his OP permission was gone.

    I noticed that #perl6 has multiple founders.  Maybe this would be a 
    solution to the lack of persistence problem.  That is to say, I could 
    make shuff a founder.

    > On 02/06/2012 12:07 AM, Philip Durbin wrote:
    >> Before I spend too much time on figuring this +i (invite-only) mode on
    >> freenode (I'm very new to IRC but I'm reading up on it), I wanted to
    >> check with you if this will work with ilbot.  That is to say, if I
    >> change my channel to +i will ilbot continue to log and work, provided I
    >> figure out how to invite it?
    >
    > I have no idea if it will work; it's not explicitly written to do that,
    > and I have never tested it.
    >
    > My advice is to deal with spam if and when it appears.

    This makes sense.  Logging the channel is a critical part of my plan so 
    I'll follow your advice.

    I'm trying to keep #crimsonfu as low-maintenance as possible.  Also, my 
    team members and I will mostly only be active in the channel during work 
    hours, so we may not get around to kicking spammers out until Monday 
    morning sometimes.  It would be sad to discover lots of spam in our logs 
    from the weekend, but I'm sure we would get over it.

    My thinking is influenced by this recent post by Anil Dash: 
    http://dashes.com/anil/2011/07/if-your-websites-full-of-assholes-its-your-fault.html

    In this case, it's a IRC channel, not a website, but the concept still 
    mostly applies.  As the founder of the channel, I'm responsible for 
    keeping the channel to the standards I set for it.

    I'd like to report back to my team that I've considered the +i idea. 
    Now I wish that we were having this conversation in public so I could 
    just link to it.  Do you mind if I publish these emails?  Perhaps we 
    could copy and paste them to a public place where others could comment 
    and discuss further.  Google+ might be a good place for this.

    Thanks for reading all this.  I hope I'm not taking too much of your 
    time.  I very much appreciate all the help you've already provided me!

    Thanks,

    Phil

    =====

    -------- Original Message --------
    Subject: Re: ilbot and +i (invite-only) mode on freenode
    Date: Mon, 06 Feb 2012 15:06:32 +0100
    From: Moritz Lenz
    To: Philip Durbin

    Hi Phil,

    On 02/06/2012 02:11 PM, Philip Durbin wrote:
    > On 02/06/2012 12:39 AM, Moritz Lenz wrote:
    >> usually spam isn't much of a problem on freenode, the staff is very good
    >> at banning spammers. At least that's my experience from over 4 years of
    >> logging #perl6, a channel we advertise everywhere on the web.
    > 
    > That's great to hear.  I do hope that spammers don't become a problem in 
    > my channel.
    > 
    > In addition to relying on freenode staffers to help fight spammers, I 
    > plan to figure out how to give other members of my team the ability to 
    > kick and ban spammers.  I tried giving them OP with this. . .
    > 
    > /msg ChanServ OP #crimsonfu shuff
    > 
    > . . . but I found that as soon as shuff left the channel and re-entered, 
    > his OP permission was gone.
    > 
    > I noticed that #perl6 has multiple founders.  Maybe this would be a 
    > solution to the lack of persistence problem.  That is to say, I could 
    > make shuff a founder.

    You can configure ChanServ to give other people permission to become
    operators themselves; I don't think you need to give them founder status
    for that -- founders are just the only ones that can alter access
    control lists.

    I don't remember the incantations you need for that, but I think I found
    them in the freenode documentation back when we recovered the channel.

    >> On 02/06/2012 12:07 AM, Philip Durbin wrote:
    >>> Before I spend too much time on figuring this +i (invite-only) mode on
    >>> freenode (I'm very new to IRC but I'm reading up on it), I wanted to
    >>> check with you if this will work with ilbot.  That is to say, if I
    >>> change my channel to +i will ilbot continue to log and work, provided I
    >>> figure out how to invite it?
    >>
    >> I have no idea if it will work; it's not explicitly written to do that,
    >> and I have never tested it.
    >>
    >> My advice is to deal with spam if and when it appears.
    > 
    > This makes sense.  Logging the channel is a critical part of my plan so 
    > I'll follow your advice.
    > 
    > I'm trying to keep #crimsonfu as low-maintenance as possible.  Also, my 
    > team members and I will mostly only be active in the channel during work 
    > hours, so we may not get around to kicking spammers out until Monday 
    > morning sometimes.  It would be sad to discover lots of spam in our logs 
    > from the weekend, but I'm sure we would get over it.

    If you find the logs full of spam, just notify me and I'll delete it.
    If that happens too often, I'll take care to revive the minimalistic
    admin interface that I've implemented for just that purpose. It allows
    authorized to mark lines in the logs as spam, and those lines will stop
    appearing in the public logs. Once in a while I would review all lines
    marked as spam, and delete them for good.

    Recent changes to the ilbot web frontend have broken that admin
    interface, and the fact that nobody noticed until now is a good sign --
    it shows it's not needed right now. If that changes, I can revive it
    within an hour or so.

    > My thinking is influenced by this recent post by Anil Dash: 
    > http://dashes.com/anil/2011/07/if-your-websites-full-of-assholes-its-your-fault.html
    > 
    > In this case, it's a IRC channel, not a website, but the concept still 
    > mostly applies.  As the founder of the channel, I'm responsible for 
    > keeping the channel to the standards I set for it.

    I have not read that blog post, but I do agree that we should make every
    effort to build kind and welcoming communities. If you need technical
    support from my side, I'll do my best to help you, but I value my time
    too much act proactively.

    > I'd like to report back to my team that I've considered the +i idea. 
    > Now I wish that we were having this conversation in public so I could 
    > just link to it.  Do you mind if I publish these emails? 

    You're welcome to publish these emails. Thank you for asking first.

    > Perhaps we 
    > could copy and paste them to a public place where others could comment 
    > and discuss further.  Google+ might be a good place for this.

    I'll leave you the choice of publishing platform. I am not involved with
    Google+ or any other major social network, so I don't care much about
    the details.

    If I want to publish things that don't seem to fit on my blog, I usally
    just use https://gist.github.com/ and present the gist URL to the
    community that is interested in it.

    Cheers,
    Moritz

Since Mortiz mentioned #perl6 on freenode, let's compare its mode to ours:

    06:12 -!- mode/#perl6 [+Cnt]
    06:12 -!- mode/#crimsonfu [+cnt]

It's almost identical.  They turn off -c (color filter) and turn on (+C) block CTCPS:

* -c (color filter)
  * This mode activates the colour filter for the channel. This filters out bold, underline, reverse video, beeps, mIRC colour codes, and ANSI escapes. Note that escape sequences will usually leave cruft sent to the channel, just without the escape characters themselves.
* +C (block CTCPS)
  * This mode blocks the sending of CTCP commands to whole channels.
