---
title: Blog
description: Latest news and insights from the Pipulate team
permalink: /blog/
layout: page
group: blog
---

# Pipulate Blog

Welcome to the Pipulate blog, where we share insights about local-first software development, modern SEO tools, and the future of AI-assisted development.

## Latest Posts

{% for post in site.posts %}
### [{{ post.title }}]({{ post.url }})
{{ post.description }}

{% endfor %} 