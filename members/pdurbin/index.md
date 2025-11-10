---
title: Philip Durbin
layout: default
---
I started the #crimsonfu IRC channel (where I went by "pdurbin") and it was a nice place to hang out for a while. You can still find the logs at <https://crimsonfu.github.io/irclogs/>.

<http://greptilian.com> is my website, where you can find links to my accounts on GitHub, etc.

I authored most of the <http://crimsonfu.github.io> home page, including our guiding principles, as well as the following posts:

<ul>

{% capture username %}{{ page.url | remove: "/index.html" | remove_first: '/members/' }}{% endcapture %}

{% for post in site.posts reversed %}
{% if post.author == username %}

<li>{{ post.date | date:"%Y-%m-%d" }}: <a href="{{ post.url }}">{{ post.title }}</a> by <a href="/members/{{post.author}}">{{ site.authors[post.author]display_name }}</a></li>

{% endif %}
{% endfor %}

</ul>
