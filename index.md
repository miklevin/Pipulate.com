---
title: "Pipulate - The Context Compiler That Helps You Prompt Well (formerly AI SEO Software)"
description: "A local-first context compiler. Every file the AI reads and the output of every command run for it, in one file you can paste into any model and replay yourself. If you can't reproduce it, it didn't happen."
permalink: /
group: home
---

# If you can't reproduce it, it didn't happen.

You're about to put your name on something an AI made, and you can't say what it did to make it. **Pipulate** is a free, open-source **context compiler**: every file the AI reads and the output of every command run on its behalf, stacked into one file you can paste into any model, keep, and replay with plain text commands. What it can't see, a vendor's server-side tool calls, it leaves out on purpose, because a step you can't rerun is a step nobody checked. Local-first, Nix-reproducible, and yours to delete. **Prompt well.**

## Quick Start: Be Running in 5 Minutes

**Want to skip the philosophy and just see what this does? Paste this into your terminal:**

```bash
curl -fsSL https://pipulate.com/install.sh | bash
```

> **Note:** Nix creates a perfectly reproducible environment, like Docker but more integrated. The first setup might take a few minutes to download dependencies, but subsequent launches are fast.

```bash
# 2. Launch it
cd ~/pipulate && nix develop
```

**What you get:** A local web app at `http://localhost:5001` with step-by-step workflows, integrated AI chat, and a JupyterLab instance at `http://localhost:8888`. No cloud required.

**Success looks like:** A one-line environment reading, then a three-door menu. Press `1` to start JupyterLab and the app server (`2` gives you a bare shell with nothing running; `3` starts both but opens the Pipulate app tab instead). The JupyterLab tab opens in your browser; run the Onboarding notebook top-to-bottom to unlock the Pipulate app (it opens automatically on future launches).

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
cd ~/pipulate
nix develop
```

### 5. The Big Reset (If Necessary)

Things sometimes go wrong. This is how you do a full Pipulate reset. This will also delete anything you downloaded with Pipulate. Adjust custom install name to what you used.

```bash
rm -rf ~/pipulate
curl -fsSL https://pipulate.com/install.sh | bash
```

Press `1` at the three-door menu, wait for the JupyterLab tab to open, then run the Onboarding notebook to unlock the Pipulate app.

### Where your work lives

<!-- START_ASCII_ART: workspace-tree -->
```text
   Notebooks/  — the JupyterLab root (NOT Pipulate's own root)
   │            FLAT siblings. Nothing nests. Nothing to get wrong.
   │
   ├── Advanced_Notebooks/     canon · flake-delivered, copy-if-absent
   ├── Educational_Notebooks/  canon · your edits survive, updates do not arrive
   ├── imports/                canon · the code-behind "sauce" modules
   │
   ├── Playground/             personal · gitignored · your own git repo goes here
   ├── Client_Work/            personal · gitignored · never leaves this machine
   ├── Deliverables/           personal · gitignored
   │
   └── Shared/                 the ONE folder for handing work to a teammate
       ├── alice/              one folder per person; you write ONLY your own
       └── bob/                single-writer partitions = zero merge conflicts
```
<!-- END_ASCII_ART: workspace-tree -->

---

## The Local-First Revolution in AI-Assisted Development

### 🔭 **Why "AI-Readiness"? Because the Honeybot Watches.**

The name changed because the visitors changed. This project grew out of SEO — that lineage is worn openly — but the agents arriving at your site today aren't search crawlers building an index for humans to browse. They're AI agents reading *for themselves*, on behalf of whoever sent them.

We don't guess at this. A retired laptop in a closet — we call it **the Honeybot** — serves a real site bare on the open internet, no CDN between it and the world, and records every visitor at the wire like fish in a lit tank. What the tank shows:

- **Content negotiation is real, and almost nobody does it.** Roughly one visiting agent in five hundred politely asks for `text/markdown` — and receives the article's original master, free. Everyone else burns compute hydrating a page and converting HTML *back into* the markdown it was born as.
- **DOM hydration leaves fingerprints.** A JavaScript trapdoor reveals which agents execute scripts and which read raw source — so "can AI actually see your page?" gets answered with telemetry, not vibes.
- **`llms.txt` gets fetched by name.** The machine-facing manifests are already being read, today.

That is what "AI-readiness" means here: **legible, verifiable, and negotiable to machine visitors** — witnessed, not asserted. (This very site practices it: request any article with `Accept: text/markdown` and the master appears.)

### 🎯 **For Practitioners Readying Clients for the Agentic Web**
Use apps that produce client-ready "deliverables" with AI assistance — the craft that grew out of SEO, pointed at the agents that now do the reading.
- **Step-by-step interfaces** that guide users through complex processes
- **Local data processing** with no cloud limits or costs
- **AI-assisted analysis** using your own local models
- **Export capabilities** for reports and data visualization

<!-- START_ASCII_ART: integrated-data-science-environment -->
### Integrated Data Science Environment  <!-- key: integrated-data-science-environment -->

Jupyter Notebooks run alongside the FastHTML server, allowing developers to prototype workflows in a familiar environment before porting them to Pipulate's step-based interface for end-users. The same Python virtual environment (`.venv`) is shared, and ad-hoc package installation is supported. If you're using Cursor, VSCode or Windsurf, set your `Ctrl`+`Shift`+`P` "Python: Set Interpreter" to "Enter Interpreter Path" `./pipulate/.venv/bin/python`. You might have to adjust based on the folder you use as your workspace. But then you'll have a Python environment unified between Cursor, JupyterLab and Pipulate.

```
      ┌──────────────────┐    ┌──────────────────┐
      │   Jupyter Lab    │    │    FastHTML      │
      │   Notebooks      │    │     Server       │
      │ ┌──────────┐     │    │  ┌──────────┐    │
      │ │ Cell 1   │     │    │  │ Step 1   │    │
      │ │          │     │--->│  │          │    │
      │ └──────────┘     │    │  └──────────┘    │
      │ ┌──────────┐     │    │  ┌──────────┐    │
      │ │ Cell 2   │     │    │  │ Step 2   │    │
      │ │          │     │--->│  │          │    │
      │ └──────────┘     │    │  └──────────┘    │
      │  localhost:8888  │    │  localhost:5001  │
      └──────────────────┘    └──────────────────┘
```
<!-- END_ASCII_ART: integrated-data-science-environment -->

### 🛠️ **For Developers**  
Transform your Jupyter Notebook experiments into production-ready workflows:
- **Reproducible environments** with Nix Flakes
- **Simple architecture** that one person can understand
- **Future-proof stack** using web standards
- **Integrated development** with JupyterLab and local AI

### What You Can Build

Pipulate excels at **data processing workflows** and **AI-assisted applications**:

- **AI-Readiness Audits**: Process search console data, analyze how agents consume your site, generate reports
- **Content Generation**: AI-powered writing assistants with local models
- **Data Dashboards**: Transform spreadsheets into interactive web applications  
- **Automation Workflows**: Step-by-step processes for repetitive tasks
- **Research Tools**: Analyze data with local AI without privacy concerns

---

## How It Works: Simplicity Meets Power

Pipulate runs like a desktop app but uses web technologies. Think **Electron**, but better:

- **🏠 Local-First**: Everything runs on your machine - data, AI, and processing
- **🔄 Auto-Updating**: One command keeps everything current
- **🌐 Cross-Platform**: Identical experience on macOS, Linux, and Windows (WSL)
- **🧠 AI-Integrated**: Local LLM integration with full privacy

## Why Local-First Wins

| **Cloud-First** | **Pipulate Local-First** |
|---|---|
| 💸 Monthly subscriptions | 🆓 Free forever |
| 🔒 Vendor lock-in | 🔓 Full control |
| 📡 Internet required | 🏠 Works offline |
| 🐌 API rate limits | ⚡ No limits |
| 👁️ Data mining | 🔐 Complete privacy |
| 🔄 Constant updates break things | 🛡️ Stable, reproducible environment |

---

## Why Pipulate? The Philosophy That Changes Everything

Traditional development follows the **DRY** (Don't Repeat Yourself) principle, creating abstract, complex systems that are hard to understand and modify. Pipulate embraces **WET** (Write Everything Twice) - explicit, readable workflows that are:

- **🔍 Observable**: See exactly what's happening at every step
- **🔧 Customizable**: Modify workflows without breaking abstractions  
- **🤖 AI-Friendly**: Clear code that AI assistants can easily understand and maintain
- **🚀 Future-Proof**: Built on durable web standards that won't become obsolete

**Deep-dive docs live in the [repository README](https://github.com/miklevin/pipulate/blob/main/README.md)** so this site can stay small and truthful.

---

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

<!-- START_ASCII_ART: architecture-overview-diagram -->
### Architecture Overview Diagram  <!-- key: architecture-overview-diagram -->

This diagram illustrates the high-level components and their interactions

```
                 ┌─────────────┐ Like Electron, but full Linux subsystem
                 │   Browser   │ in a folder for macOS and Windows (WSL)
                 └─────┬───────┘
                       │ HTTP/WS
                       ▼
    ┌───────────────────────────────────────┐
    │           Nix Flake Shell             │ - In-app LLM (where it belongs)
    │  ┌───────────────┐  ┌──────────────┐  │ - 100% reproducible
    │  │   FastHTML    │  │    Ollama    │  │ - 100% local
    │  │   HTMX App    │  │  Local LLM   │  │ - 100% multi-OS
    │  └───────┬───────┘  └──────────────┘  │
    │          │                            │
    │    ┌─────▼─────┐     ┌────────────┐   │
    │    │MiniDataAPI│◄───►│ SQLite DB  │   │
    │    └───────────┘     └────────────┘   │
    └───────────────────────────────────────┘
```

This complete, self-contained environment runs identically on any operating system, providing the foundation for all Pipulate workflows and AI interactions.
<!-- END_ASCII_ART: architecture-overview-diagram -->


## The Repository Is the Documentation

This public site is now the launchpad: install, orient, and then hand off to the source of truth. The detailed philosophy, workflow patterns, and developer notes live in the repository where the code changes with them.

1. **[Repository README](https://github.com/miklevin/pipulate/blob/main/README.md)** - Complete overview, philosophy, and usage notes
2. **[GitHub Repository](https://github.com/miklevin/pipulate)** - Source code, issues, and project history

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

[**Install Pipulate →**](/install) | [**Read the README →**](https://github.com/miklevin/pipulate/blob/main/README.md) | [**View the Code →**](https://github.com/miklevin/pipulate)

---

*Pipulate is free and open source software created by [Mike Levin](https://mikelev.in/). Join the movement toward local-first, AI-assisted development.*
