---
layout: default
title: crimsonfu - sysadmins who code
---
On topic: Linux, Puppet, scripting, automation, best practices, **C**onfigu**R**at**I**on **M**anagement of **S**ystems **O**r **N**etwork kung **FU** 

## Guiding Principles

* Strength in Numbers
* Open Source by Default
* [When in Doubt, Make it Public](http://www.codinghorror.com/blog/2007/04/when-in-doubt-make-it-public.html)

## IRC channel

A publicly-logged IRC channel (#crimsonfu on freenode) is our primary means of communication.

Our IRC logs can be found at http://irclog.perlgeek.de/crimsonfu and we sometimes back them up to our [irclogs](irclogs) page with [a script](bin/logfetch.pl).

## Articles

<ul>
{% for post in site.posts reversed %}
<li>{{ post.date | date:"%Y-%m-%d" }}: <a href="{{ post.url }}">{{ post.title }}</a> by <a href="/members/{{post.author}}">{{ site.authors[post.author]display_name }}</a></li>
{% endfor %}
</ul>

## Members

See our [members](members) page.

## About the name crimsonfu

Crimson is the color associated with the school where the founders met, but **we welcome all comers**!  Fu is a nod to http://commandlinefu.com and http://catb.org/jargon/html/F/suffix-fu.html

[topical channel]: http://freenode.net/policy.shtml#topicalchannels

## Updating this website

The source is at http://github.com/crimsonfu/crimsonfu.github.com 
