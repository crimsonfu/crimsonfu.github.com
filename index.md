---
layout: default
title: crimsonfu - sysadmins who code
---
<a href="https://github.com/crimsonfu/crimsonfu.github.com/blob/master/images/crimsonfu-logo.svg"><img src="http://www.gravatar.com/avatar/5accd79d827a12591f4b2ba652362688?s=48" alt="crimsonfu logo, patches welcome!"></a>
`{"crimsonfu": "ConfiguRatIon Management of Systems Or Network kung FU"}`

## Guiding principles

* None of us is as smart as all of us
* Open source by default
* [When in doubt, make it public](http://www.codinghorror.com/blog/2007/04/when-in-doubt-make-it-public.html)

## On topic

{% include topics.yaml %}

See also http://crimsonfu.github.com/topics

## Publicly-logged IRC channel: #crimsonfu on Freenode

\#crimsonfu, a publicly-logged IRC channel on [Freenode](http://freenode.net), is our primary means of communication.

Our IRC logs can be found at http://irclog.perlgeek.de/crimsonfu

We log our channel because "[we live in a world of infinitely searchable micro-content, and every contribution, however small, enriches all of us.](http://www.codinghorror.com/blog/2007/04/when-in-doubt-make-it-public.html)"  Sometimes back them up to our [irclogs](irclogs) page with [a script](bin/logfetch.pl).

If you enjoy the [topics](topics) [we talk about][logs], you are welcome to join the conversation!  The easiest way is via http://webchat.freenode.net/?channels=crimsonfu

## Articles

<ul>
{% for post in site.posts reversed %}
<li>{{ post.date | date:"%Y-%m-%d" }}: <a href="{{ post.url }}">{{ post.title }}</a> by <a href="/members/{{post.author}}">{{ site.authors[post.author]display_name }}</a></li>
{% endfor %}
</ul>

## Members

See our [members](members) page and https://github.com/crimsonfu

## About the name crimsonfu

Crimson is the color associated with the school where the founders met (as staff members), but **we welcome all comers**!  We will avoid insularity and hope to slowly attract a diverse membership.

Fu is a nod to http://commandlinefu.com and http://catb.org/jargon/html/F/suffix-fu.html

## Updating this website

The source is at http://github.com/crimsonfu/crimsonfu.github.com 

[logs]: http://irclog.perlgeek.de/crimsonfu
