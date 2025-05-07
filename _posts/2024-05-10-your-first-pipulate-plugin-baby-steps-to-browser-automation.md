---
title: "Your First Pipulate Plugin: Baby Steps to Browser Automation"
description: "Start your journey with Pipulate by creating your first plugin - a simple copy/paste exercise that sets the foundation for powerful browser automation."
date: 2024-05-10
author: Mike Levin
group: blog
---

If you've just installed Pipulate and you're wondering "What now?", you're in the right place. Let's create your first plugin together - and I promise, we'll start with the absolute smallest possible step.

## The Goal: Your First Plugin

Today, we're going to do just ONE thing:
1. Create a new plugin and see it appear in Pipulate's menu

That's it! No coding, no complexity - just a simple copy/paste to get you started. This will be the foundation for something cool we'll build together: a plugin that helps you automate browser tasks.

## Why Start So Small?

Because every journey begins with a single step. In our next articles, we'll transform this simple template into a useful tool that can:
- Open web pages automatically using Python's built-in tools
- Work with your browser's existing logins and settings
- Help you automate repetitive web tasks

But today, we're just getting our feet wet.

## The Three-Step Plugin

Here's all you need to do:

1. Navigate to your Pipulate installation:
```bash
cd ~/Botifython/plugins  # (or whatever name you chose during installation)
```

2. Copy the blank workflow template with the `xx_` prefix (this prevents auto-loading while we edit):
```bash
cp 500_blank_workflow.py xx_my_first_workflow.py
```

3. Open `xx_my_first_workflow.py` in your favorite text editor and change just these two lines:
```python
APP_NAME = "myflow"           # Change this to your unique identifier
DISPLAY_NAME = "My Workflow"  # Change this to your display name
```

4. Once you've made your changes, rename the file to deploy it:
```bash
mv xx_my_first_workflow.py 040_my_first_workflow.py
```

That's it! The moment you rename the file, Pipulate's watchdog system will detect the change and automatically load your new plugin. You'll see "My Workflow" appear in the dropdown menu instantly - no restart needed!

## What Just Happened?

Let's break down what we did:
- Used the `xx_` prefix to safely edit the file without conflicts
- Changed the basic configuration values
- Renamed the file to deploy it
- Let Pipulate's watchdog system automatically detect and load the changes

The number at the start of the filename (040) determines where it appears in the menu - lower numbers appear higher in the list.

## Development Tips

Pipulate has some helpful patterns for plugin development:
- Files starting with `xx_` are ignored by the auto-loader
- Files with parentheses (like `(Copy)`) are also ignored
- The watchdog system automatically detects and loads changes when you rename files
- No server restart is needed - changes are picked up instantly

## What's Next?

In our next article, we'll take this blank template and add a simple text input field where you can enter a website URL. Then we'll show you how to make Pipulate open that URL in your browser - all while using your existing browser profile with your saved passwords and settings.

This is just the beginning of what's possible with Pipulate's workflow system. We're starting small, but we're building towards something powerful: the ability to automate browser-based tasks without complex API integrations or authentication headaches.

## Why This Matters

Many SEO tools require complex API setups, token management, and expensive subscriptions. But sometimes, the simplest solution is to use your existing browser setup - your saved logins, your cookies, your bookmarks. That's the path we're starting down today.

Stay tuned for the next article, where we'll add our first piece of real functionality to this template. For now, just enjoy seeing your very first Pipulate plugin appear in the menu the moment you rename it! 