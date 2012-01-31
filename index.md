---
layout: default
title: crimsonfu - sysadmins who code
---
**CRIMSON Fu**: **C**onfigu**R**at**I**on **M**anagement of **S**ystems **O**r **N**etwork kung **FU** 

## On topic

* Linux
* Puppet
* scripting, automation
* best practices
* ...

## Guiding Principles

* Strength in Numbers
* Open Source by Default
* [When in Doubt, Make it Public](http://www.codinghorror.com/blog/2007/04/when-in-doubt-make-it-public.html)

## Articles

<ul>
{% for post in site.posts reversed %}
<li>{{ post.date | date:"%Y-%m-%d" }}: <a href="{{ post.url }}">{{ post.title }}</a> by <a href="/members/{{post.author}}">{{ site.authors[post.author]display_name }}</a></li>
{% endfor %}
</ul>

## Members

* Philip Durbin (pdurbin on freenode): http://greptilian.com
* Steve Huff (shuff on freenode, [hakamadare](https://github.com/hakamadare) on GitHub, [SHUFF](https://metacpan.org/author/SHUFF) on CPAN)

## About the name crimsonfu

"Crimson" because this group is being started by members of the Harvard community.  "Fu" is a nod to http://commandlinefu.com

[topical channel]: http://freenode.net/policy.shtml#topicalchannels

## Updating this website

The source is at http://github.com/crimsonfu/crimsonfu.github.com 
