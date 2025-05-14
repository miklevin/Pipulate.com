---
title: Guide
description: Pipulate Developer Guide
permalink: /guide/
layout: page
group: guide
---

# Pipulate Guide

> **Quick Reference**: For a condensed overview of development patterns and workflows, see the [Development Guide](/development/). This guide provides the detailed, step-by-step version of that content.

Welcome to the Pipulate guide, where we introduce you to local-first software
development, Python, HTMX, FastHTML, modern SEO tools, and the future of
AI-assisted development. Follow the sequence of posts to build up the full story
and jump on the Pipulate Workflow Development bandwagon.

<div class="blog-grid">
{% for post in site.posts reversed %}
    <article class="blog-card">
        <header>
            <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
            <span class="post-number">Post #{{ forloop.index }} of {{ site.posts.size }}</span>
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

.post-number {
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
