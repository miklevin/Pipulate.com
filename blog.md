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

<div class="blog-grid">
{% for post in site.posts reversed %}
    <article class="blog-card">
        <header>
            <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
            <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time>
        </header>
        <p>{{ post.description }}</p>
    </article>
{% endfor %}
</div>

<style>
.blog-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
    margin: 2rem 0;
}

.blog-card {
    background: var(--card-background-color, rgba(255, 255, 255, 0.05));
    border-radius: 8px;
    padding: 1.5rem;
    transition: transform 0.2s ease-in-out;
}

.blog-card:hover {
    transform: translateY(-4px);
}

.blog-card header {
    margin-bottom: 1rem;
}

.blog-card h3 {
    margin: 0;
    font-size: 1.25rem;
}

.blog-card h3 a {
    text-decoration: none;
}

.blog-card h3 a:hover {
    text-decoration: underline;
}

.blog-card time {
    display: block;
    color: var(--muted-color);
    font-size: 0.9rem;
    margin-top: 0.5rem;
}

.blog-card p {
    margin: 0;
    color: var(--muted-color);
}

@media (max-width: 768px) {
    .blog-grid {
        grid-template-columns: 1fr;
    }
}
</style> 