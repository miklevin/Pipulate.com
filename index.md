---
title: Pipulate
description: The Local-First Revolution in AI-Assisted Development
permalink: /
group: home
---

# The Local-First Revolution in AI-Assisted Development

In an era dominated by cloud subscriptions and complex frameworks, **Pipulate champions a local-first revolution**. It's a free, open-source framework that transforms how you build AI-assisted applications by embracing a radical philosophy: **explicit code is better than abstract code** when you have AI to help manage it.

> **Your data. Your AI. Your machine. Your control.**  
> No subscriptions, no vendor lock-in, no cloud costs.

## Why Pipulate? The Philosophy That Changes Everything

Traditional development follows the **DRY** (Don't Repeat Yourself) principle, creating abstract, complex systems that are hard to understand and modify. Pipulate embraces **WET** (Write Everything Twice) - explicit, readable workflows that are:

- **🔍 Observable**: See exactly what's happening at every step
- **🔧 Customizable**: Modify workflows without breaking abstractions  
- **🤖 AI-Friendly**: Clear code that AI assistants can easily understand and maintain
- **🚀 Future-Proof**: Built on durable web standards that won't become obsolete

**[Learn more about the WET Philosophy →](/guide/wet-blueprint/)**

## How It Works: Simplicity Meets Power

Pipulate runs like a desktop app but uses web technologies. Think **Electron**, but better:

- **🏠 Local-First**: Everything runs on your machine - data, AI, and processing
- **🔄 Auto-Updating**: One command keeps everything current
- **🌐 Cross-Platform**: Identical experience on macOS, Linux, and Windows (WSL)
- **🧠 AI-Integrated**: Local LLM integration with full privacy

### The Technical Magic
```python
# This is how simple Pipulate code looks
@rt("/process-data")
def process_data():
    return Div(
        H1("Processing Complete ✅"),
        P("Your data has been analyzed locally"),
        hx_get="/next-step",
        hx_trigger="load"
    )
```

No template languages. No build steps. No client-side JavaScript frameworks. Just **Python functions that generate HTML**, powered by **HTMX** for seamless interactivity.

## Perfect For SEO Practitioners & Developers

### 🎯 **For SEO Practitioners**
Transform your Jupyter Notebook experiments into production-ready workflows:
- **Step-by-step interfaces** that guide users through complex processes
- **Local data processing** with no cloud limits or costs
- **AI-assisted analysis** using your own local models
- **Export capabilities** for reports and data visualization

### 🛠️ **For Developers**  
Build applications the way they should be built:
- **Reproducible environments** with Nix Flakes
- **Simple architecture** that one person can understand
- **Future-proof stack** using web standards
- **Integrated development** with JupyterLab and local AI

---

## Quick Start: Be Running in 5 Minutes

### 1. Install Nix (One-Time Setup)

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

**Close your terminal and open a new one after installation.**

### 2. Install Pipulate

With a custom name
```bash
curl -L https://pipulate.com/install.sh | sh -s Botifython
```

Or default installation
```bash
curl -L https://pipulate.com/install.sh | sh
```

### 3. Start Building

```bash
cd ~/Botifython
nix develop
```

These few commands:
- ✅ Updates to the latest version automatically
- ✅ Starts JupyterLab and the Pipulate server  
- ✅ Opens web interfaces in your browser
- ✅ Provides a complete, reproducible development environment

**That's it!** You now have a local-first development environment with AI integration.

### 4. Run It Again!

1. You can just forcibly exit out of that Terminal it's running from.
2. Open a new Terminal, and once again:

```bash
cd ~/Botifython
nix develop
```

### 5. The Big Reset (If Necessary)

Things sometimes go wrong. This is how you do a full Pipulate reset. This will also delete anything you downloaded with Pipulate. Adjust custom install name to what you used.

```bash
rm -rf ~/Botifython
curl -L https://pipulate.com/install.sh | sh -s Botifython
cd ~/Botifython
nix develop
```

Wait for ***BOTH TABS*** to auto-open in your browser.

---

## Why Local-First Wins

| **Cloud-First** | **Pipulate Local-First** |
|---|---|
| 💸 Monthly subscriptions | 🆓 Free forever |
| 🔒 Vendor lock-in | 🔓 Full control |
| 📡 Internet required | 🏠 Works offline |
| 🐌 API rate limits | ⚡ No limits |
| 👁️ Data mining | 🔐 Complete privacy |
| 🔄 Constant updates break things | 🛡️ Stable, reproducible environment |

## What You Can Build

Pipulate excels at **data processing workflows** and **AI-assisted applications**:

- **SEO Analysis Tools**: Process search console data, analyze competitors, generate reports
- **Content Generation**: AI-powered writing assistants with local models
- **Data Dashboards**: Transform spreadsheets into interactive web applications  
- **Automation Workflows**: Step-by-step processes for repetitive tasks
- **Research Tools**: Analyze data with local AI without privacy concerns

---

## The Complete Guided Experience

Ready to dive deeper? Our **[Guide](/guide/)** takes you through the complete journey:

1. **[The WET Blueprint](/guide/wet-blueprint/)** - The philosophy that changes everything
2. **[Understanding Pipulate](/guide/local-first-revolution/)** - Architecture and approach
3. **[Building Your First Workflow](/guide/chain-reaction-pattern/)** - Hands-on development
4. **[Advanced Patterns](/guide/the-future-is-simple/)** - Expert-level techniques

---

## System Requirements

- **macOS**: 10.15 or later
- **Linux**: Most modern distributions  
- **Windows**: WSL2 with Ubuntu 20.04+
- **Memory**: 8GB RAM recommended
- **Storage**: 2GB free disk space

---

## Join the Local-First Revolution

The future of software development is looking more like the past, but with AI capabilities that make it even better. It's a future where:

- **One person** can understand and manage the whole stack
- **Privacy** is the default, not an afterthought
- **Tools** are simple but powerful  
- **Users** have complete control

**Start your revolution today.**

[**Install Pipulate →**](/install) | [**Read the Guide →**](/guide/) | [**View the Code →**](https://github.com/miklevin/pipulate)

---

*Pipulate is free and open source software created by [Mike Levin](https://mikelev.in/). Join the movement toward local-first, AI-assisted development.*
