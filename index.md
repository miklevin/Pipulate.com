---
title: Pipulate
description: Pipulate Free and Open Source SEO Software
permalink: /
group: home
---

# Pipulate Installation Guide

Pipulate is a *simpler alternative* to using Jupyter Notebooks for SEO automation. It lets you create step-by-step workflows that run locally on your machine, without needing to write Python code. Think of it as Jupyter Notebooks, but designed specifically for SEO practitioners who want to automate their work without becoming developers. It runs like a website on your local machine. Follow instructions to install...

## Process

### 1. Install Nix (One-Time Setup)

First, install the Nix package manager:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

* Follow the on-screen prompts (type "Yes" when asked)
  * You will be prompted for your (Apple) hardware login.
  * You will ***not be able to see yourself type*** in the password.
  * There will be 2 "Yes" to confirm messages.
* **Important:** After installation completes, close your terminal and open a new one.

### 2. Install Pipulate

With Nix installed, run this command to install Pipulate:

```bash
curl -L https://pipulate.com/install.sh | sh -s Botifython
```

* Replace `Botifython` with your preferred name (or omit for default "pipulate")
* The installer downloads and configures everything automatically
* First-time installation creates a directory at `~/Botifython`

### 3. Starting Pipulate

After initial installation, you can start Pipulate anytime with:

```bash
cd ~/Botifython && nix develop
```

This command:
* Updates to the latest version automatically
* Starts JupyterLab and the Pipulate server
* Opens web interfaces in your browser

## Troubleshooting & Management

### Reinstalling Pipulate

If you need to start fresh:

```bash
# Remove the existing installation
rm -rf ~/Botifython

# Reinstall
curl -L https://pipulate.com/install.sh | sh -s Botifython
```

### Uninstalling the Nix Package Manager

If you need to remove Nix completely:

```bash
/nix/nix-installer uninstall
```

This removes the Nix package manager from your system (but preserves any Pipulate installations).

## System Requirements

* macOS: 10.15 or later
* Linux: Most modern distributions
* Windows: WSL2 with Ubuntu 20.04+
* 8GB RAM recommended
* 2GB free disk space

## About Nix

Pipulate uses Nix to ensure a consistent, reproducible environment across all operating systems. This means:

- **Identical Environments**: The same Python version, packages, and system libraries on every machine
- **No Conflicts**: Isolated from your system's Python installation
- **Easy Updates**: One command to update everything
- **Cross-Platform**: Works identically on macOS, Linux, and Windows (via WSL)

The Nix environment includes:
- Python 3.x with all required packages
- JupyterLab for development and experimentation
- Local LLM support via Ollama
- All necessary system libraries

This approach eliminates the "works on my machine" problem and ensures Pipulate runs reliably everywhere.

[Learn more about our local-first approach in our Guide →](/guide/)

---

## Why Pipulate Changes Everything

### The Perfect Complement to Your Existing SEO Stack

Pipulate runs entirely on your computer, handling the nimble analysis tasks that work best locally while integrating seamlessly with enterprise platforms like Botify and others for the heavy lifting.

```
Enterprise SaaS (Botify, etc.)     +    Local Pipulate
├── Million-page crawls            +    Custom workflow automation
├── Large-scale data processing    +    Rapid prototyping & testing
├── Team collaboration features    +    Personal analysis pipelines  
├── Enterprise reporting           +    Ad-hoc data exploration
└── Robust infrastructure          +    Complete privacy & control
```

### Turn Complex Scripts Into Guided Workflows

Pipulate transforms powerful Python SEO scripts into step-by-step workflows that anyone can use. No coding required—just follow the guided process from start to finish.

```
Before: Complex Python Script              After: Guided Workflow
┌─────────────────────────────────┐       ┌─────────────────────────────────┐
│ # Fetch Botify data             │       │ Step 1: Enter Project URL       │
│ auth = get_botify_token()       │  -->  │ [https://example.com_______] ✓  │
│ project = fetch_project(url)    │       │                                 │
│ analysis = get_latest_crawl()   │       │ Step 2: Select Analysis Type    │
│ # 47 more lines of code...      │       │ ○ Full Site  ● Link Analysis    │
│                                 │       │                                 │
│ # Generate network graph        │       │ Step 3: Generate Graph          │
│ nodes = process_links()         │       │ [Generate Visualization] ✓      │
│ # etc...                        │       │                                 │
└─────────────────────────────────┘       └─────────────────────────────────┘
```

### AI Assistant That Actually Understands SEO

Built-in AI (running locally on your machine) provides contextual help throughout your workflows. No API keys, no external services—just intelligent assistance when you need it.

- **Workflow Guidance**: Get help understanding each step
- **Data Interpretation**: AI explains what your results mean
- **Content Generation**: Create SEO content without external APIs
- **Technical Support**: Troubleshoot issues with context-aware assistance

### Real SEO Workflows You Can Use Today

#### Enhanced Botify Analysis
Transform your Botify crawl exports into interactive network visualizations and custom analysis pipelines that extend your enterprise platform's capabilities.

#### Cross-Platform Data Integration  
Combine data from multiple sources—Botify APIs, Search Console, custom crawls—into unified analysis workflows that provide insights across your entire SEO stack.

#### Rapid Prototyping & Testing
Quickly test new SEO hypotheses and analysis approaches locally before implementing them at scale in your enterprise tools.

#### Custom Reporting & Automation
Build personalized reporting workflows that pull from your existing tools and present data exactly how you need it.

### The Local-First Advantage

**Privacy by Design**: Keep sensitive competitive analysis and proprietary methodologies secure on your local machine.

**Unlimited Local Processing**: Use your full CPU/GPU power for AI analysis, data manipulation, and custom algorithms—perfect for the tasks that work best locally.

**Seamless Integration**: Pull data from any source—Botify APIs, Search Console, CSVs, manual exports—into unified local workflows.

**Development Freedom**: Prototype and test new analysis approaches without affecting your production enterprise tools.

### Perfect for SEO Teams

**Agencies**: Standardize complex processes across team members while protecting client data.

**In-House Teams**: Share SEO methodology without sharing code or technical complexity.

**Freelancers**: Extend your existing tool capabilities with custom local analysis workflows.

**Technical SEOs**: Transform your Python scripts into shareable workflows that complement your enterprise SEO platform.

---

## Ready to Get Started?

Everything you need is included:
- **Pipulate Workflows**: Guided SEO processes
- **JupyterLab**: For creating and testing custom analyses  
- **Local AI**: Ollama integration for intelligent assistance
- **All Dependencies**: Managed automatically by Nix

**Extends your existing SEO tools. Works with any platform. Completely local.**

[Get started with the installation above ↑](#pipulate-installation-guide)

---

### Learn More

- **[About Pipulate](/about/)** - Detailed overview of features and capabilities
- **[Philosophy](/philosophy/)** - Why we built Pipulate this way  
- **[Guide](/guide/)** - In-depth tutorials and workflow creation
- **[GitHub](https://github.com/miklevin/pipulate)** - Source code and development

*Built by the most technical SEOs in the world, for the least technical SEOs in the world. Open source and always will be.*
