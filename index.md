---
layout: default
title: crimsonfu - sysadmins who code
---
On topic: **C**onfigu**R**at**I**on **M**anagement of **S**ystems **O**r **N**etwork kung **FU**, Linux, scripting, automation, best practices

## Guiding principles

* none of us is as smart as all of us
* open source by default
* [when in doubt, make it public](http://www.codinghorror.com/blog/2007/04/when-in-doubt-make-it-public.html)

## Publicly-logged IRC channel: #crimsonfu on freenode

A [publicly-logged IRC channel][logs] (#crimsonfu on http://freenode.net ) is our primary means of communication.

We [log our channel][logs] because "we live in a world of infinitely searchable micro-content, and every contribution, however small, enriches all of us." -- http://www.codinghorror.com/blog/2007/04/when-in-doubt-make-it-public.html

Our [IRC logs][logs] can be found at http://irclog.perlgeek.de/crimsonfu and we sometimes back them up to our [irclogs](irclogs) page with [a script](bin/logfetch.pl).

If you enjoy the [things we talk about][logs], you are welcome to join the conversation!  The easiest way is via http://webchat.freenode.net/?channels=crimsonfu

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
