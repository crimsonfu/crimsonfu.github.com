---
title: Philip Durbin
layout: default
---
I started the #crimsonfu IRC channel (where I go by "pdurbin") and arranged for it to be logged at http://irclog.perlgeek.de/crimsonfu

http://greptilian.com is my website, where you can find links to my accounts on GitHub, Twitter, etc.

I authored most of the http://crimsonfu.github.com home page, including our guiding principles, as well as the following posts:

<ul>

{% capture username %}{{ page.url | remove: "/index.html" | remove_first: '/members/' }}{% endcapture %}

{% for post in site.posts reversed %}
{% if post.author == username %}

<li>{{ post.date | date:"%Y-%m-%d" }}: <a href="{{ post.url }}">{{ post.title }}</a> by <a href="/members/{{post.author}}">{{ site.authors[post.author]display_name }}</a></li>

{% endif %}
{% endfor %}

</ul>
