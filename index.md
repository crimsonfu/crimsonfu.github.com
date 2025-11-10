---
layout: default
title: crimsonfu - sysadmins who code
---
<a href="https://github.com/crimsonfu/crimsonfu.github.com/blob/master/images/crimsonfu-logo.svg"><img src="http://www.gravatar.com/avatar/5accd79d827a12591f4b2ba652362688?s=48" alt="crimsonfu logo, patches welcome!"></a>
`{"crimsonfu": "ConfiguRatIon Management of Systems Or Network kung FU"}`

## Status

`#crimsonfu` was a fun IRC channel on the freenode network but it doesn't exist anymore. You can find the logs at <https://crimsonfu.github.io/irclogs/>.

## Guiding principles

* None of us is as smart as all of us
* Open source by default
* [When in doubt, make it public](http://www.codinghorror.com/blog/2007/04/when-in-doubt-make-it-public.html)

## On topic

{% include topics.yaml %}

See also <https://crimsonfu.github.io/topics>

## Publicly-logged IRC channel: #crimsonfu on Freenode

Our primary means of communication waas an IRC channel on [Freenode](http://freenode.net) called #crimsonfu that we logged publicly because "[we live in a world of infinitely searchable micro-content, and every contribution, however small, enriches all of us](http://www.codinghorror.com/blog/2007/04/when-in-doubt-make-it-public.html)."

From time to time, we run [a script](bin/logfetch.pl) to back up our logs to <http://crimsonfu.github.io/irclogs> which means they'll be included in a git clone of our website repo for easy offline searching.

## Articles

<ul>
{% for post in site.posts reversed %}
<li>{{ post.date | date:"%Y-%m-%d" }}: <a href="{{ post.url }}">{{ post.title }}</a> by <a href="/members/{{post.author}}">{{ site.authors[post.author]display_name }}</a></li>
{% endfor %}
</ul>

## Members

See our [members](members) page and <https://github.com/crimsonfu>

## About the name crimsonfu

Crimson is the color associated with the school where the founders met (as staff members), but **we welcome all comers**!  We will avoid insularity and hope to slowly attract a diverse membership.

Fu is a nod to <http://commandlinefu.com and http://catb.org/jargon/html/F/suffix-fu.html>

## Updating this website

The source is at <http://github.com/crimsonfu/crimsonfu.github.com>
