---
title: About Pipulate
description: What is Pipulate Free and Open Source SEO Software?
permalink: /about/
group: about
---

# About Pipulate

> Pipulate is a local-first, AI-assisted development framework that transforms how you run SEO workflows by embracing Notebooks without any code.

## AI On Rails: The Answer to Agentic Mode

Ask an AI to do something in *Agentic Mode* and it's going to go off half-cocked and willy nilly doing whatever it thinks is right until done. Put AIs on Rails with Pipulate using rigid linear workflows prepared by domain experts. Leverage local AI without training the frontier models and keep your secret recipes secret.

<!-- START_ASCII_ART: about-pipulate -->
## AI On Rails: The Answer to Agentic Mode  <!-- key: about-pipulate -->

**The Problem with Agentic AI:** Unpredictable, cloud-dependent, and trains frontier models with your data.

**The Pipulate Solution:** Local AI guided by domain expert workflows, keeping your intelligence sovereign.

Agentic Mode is like a box of chocolates — you never know what you're gonna get. Ask an AI to do something in *Agentic Mode* and it's going to go off and do whatever it thinks is right until done. But what if there were a domain expert in the picture who sets everything up ahead of time ensuring proper AI coralling and wrangling?

**Put AIs on Rails with Pipulate:** Rigid linear workflows prepared by domain experts, leveraging local AI without training frontier models. Your secret recipes stay secret, your data stays yours, and your AI grows with you on your own hardware.

```
      🤖 AGENTIC MODE (Chaos)           🚂 AI ON RAILS (Pipulate)
      ═══════════════════════           ══════════════════════════

          💥 GOES OFF                      📊 LINEAR WORKFLOWS
          HALF-COCKED!                      BY DOMAIN EXPERTS
               │                                   │
               ▼                                   ▼
      ╔════════════════════╗            ┌─────────────────────┐
      ║  🌪️ WILLY NILLY 🎲 ║            │  Step 1: Analyze▸   │
      ║                    ║     VS     │  Step 2: Process▸   │
      ║   Unpredictable    ║            │  Step 3: Report▸    │
      ║      Results       ║            │  Step 4: Export▸    │
      ╚════════════════════╝            └─────────────────────┘
               │                                   │
               ▼                                   ▼
    ☁️ Trains Frontier Models        🏠 Keeps Domain Expertise Local
```

1. 🖥️ **Runs locally** like a desktop app using modern web technologies
2. 🐍 **Simple linear workflow** approach powered by HTMX for seamless interactivity
3. 📓 **Transforms Jupyter Notebooks** into production-ready, step-by-step workflows
4. 🤖 **Integrated AI assistance** using your own local models with complete privacy
5. 🔧 **Reproducible environments** with Nix that work identically across all platforms
6. 🎯 **Perfect for SEO practitioners** who want to turn technical expertise into guided, reusable workflows
<!-- END_ASCII_ART: about-pipulate -->

1. 🖥️ **Runs locally** like a desktop app using modern web technologies
2. 🐍 **Simple linear workflow** approach powered by HTMX for seamless interactivity  
3. 📓 **Transforms Jupyter Notebooks** into production-ready, step-by-step workflows
4. 🤖 **Integrated AI assistance** using your own local models with complete privacy
5. 🔧 **Reproducible environments** with Nix that work identically across all platforms
6. 🎯 **Perfect for SEO practitioners** who want to turn technical expertise into guided, reusable workflows

---

## What Audience Are You?

Pipulate can be very technical or dirt simple. It all depends if you're going to develop for it or just use it. The analogy we use here is wither you are the chef at a restaurant or just someone enjoying a meal.

> A chef talks about chopping techniques and flavor profiles. A diner just wants to know if the pasta is amazing.  

## Chef or Customer?

<!-- START_ASCII_ART: target-audience -->
## Chef or Customer?  <!-- key: target-audience -->

Are you a Developer or an End User? Chef or Customer? Understanding your audience is crucial for effective development. Pipulate serves two distinct but complementary audiences, much like a restaurant serves both chefs and customers

```
    ┌──────────────────────────────────────────────────────────┐
    │                      The Restaurant                      │
    │  ┌──────────────────┐              ┌──────────────────┐  │
    │  │   Kitchen (Dev)  │              │  Dining Room     │  │
    │  │                  │              │  (End Users)     │  │
    │  │                  │              │                  │  │
    │  │  👨‍🍳 Sous Chef    │───recipes───►│  🍽️ Customers    │  │
    │  │  👩‍🍳 Head Chef    │              │  🏢 Restaurateur │  │
    │  │                  │              │                  │  │
    │  │ "How do we make  │              │ "I want the best │  │
    │  │  pasta you've    │              │  pasta I've ever │  │
    │  │  never had?"     │              │  had in my life" │  │
    │  └──────────────────┘              └──────────────────┘  │
    └──────────────────────────────────────────────────────────┘
```
<!-- END_ASCII_ART: target-audience -->

---

## ROLES

1. **Chefs *Make Workflows:*** Much to learn!
2. **Customers *USE Workflows:*** Just install, pick workflow and cick:
   - Step #1: Next ▸
   - Step #2: Next ▸
   - Step #3: Next ▸

Okay, sometimes you have to fill in some fields.

---

### Am I having a Sous Chef conversation? Yes/No
   1. We can make a pasta you've never had before
   2. Add consistency to your own pasta recipe

### Am I talking to patron or restaurateur instead?
   1. Do you want to have the most amazing bowl of pasta you've ever had in your life?
   2. The dish you like perfect every time
   3. And some choices

These are different conversations.

---

## What Is Pipulate?

Pipulate is a free, open-source SEO desktop application that runs entirely on your computer. It gives you the power of complex SEO scripts and Jupyter notebooks, but with a friendly, guided interface where AI helps you every step of the way.

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

## Core Features

### Local-First Revolution
- **Your Data Stays Yours**: No cloud storage means complete privacy
- **No Subscription Costs**: Use hardware you already own
- **No Vendor Lock-in**: Freedom from proprietary platforms
- **Full Resource Access**: Run intensive tasks 24/7 without limits

### Workflow-Based Design
- **Guided Progression**: Clear path from start to finish
- **Persistent State**: Each step's results are saved
- **Interruptible**: Stop and resume complex processes anytime
- **Easy to Follow**: Perfect for documenting and sharing SEO processes

```
  ┌─────────┐        ┌─────────┐        ┌─────────┐   - Fully customizable steps
  │ Step 01 │─piped─►│ Step 02 │─piped─►│ Step 03 │   - Interruption-safe & resumable
  └─────────┘        └─────────┘        └─────────┘   - Easily ported from Notebooks
       │                  │                  │        - One DB record per workflow run
       ▼                  ▼                  ▼        - Everything stays on your machine
  State Saved        State Saved         Finalized?   - Magnitudes simpler than celery
```

### Integrated AI Capabilities
- **Local LLM Integration**: Uses Ollama to run AI models on your computer
- **Contextual Help**: AI assistance that understands your workflow
- **Content Generation**: Create SEO content without external APIs
- **Data Analysis**: AI-assisted interpretation of your SEO data

```
                   ┌──────────────────┐
                   │   Local Ollama   │ - No API keys needed
                   │      Server      │ - Completely private processing
                   └────────┬─────────┘
                            │
                            │ Streaming via WebSocket
                            ▼
                   ┌──────────────────┐
                   │   Pipulate App   │ - Monitors WS for MCP tool-call commands
                   │(WebSocket Client)│ - Parses responses in real-time
                   └────────┬─────────┘
                            │
                            │ In-memory or DB backed
                            ▼
                   ┌──────────────────┐
                   │     Bounded      │ - Manages context window (~128k)
                   │   Chat History   │ - Enables RAG / tool integration
                   └──────────────────┘
```

### Developer-Friendly Environment
- **Integrated Jupyter**: Create and test SEO code in familiar notebooks
- **Simple Plugin System**: Add new workflows with minimal boilerplate
- **Consistent Environment**: Works identically across macOS, Linux, and Windows (WSL)
- **Open Architecture**: Every component is transparent and modifiable

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

## Who Pipulate Is For

### SEO Professionals
If you're tired of:
- Subscription costs for SEO tools
- Limited API access or usage caps
- Privacy concerns with cloud-based platforms
- Fragmented workflows across multiple tools

Pipulate gives you a consistent, integrated SEO workbench completely under your control.

### Technical SEOs & Developers
If you already use Python for SEO but want:
- A better way to share your scripts with non-technical team members
- A consistent environment for SEO tool development
- An easy way to turn notebooks into reusable applications
- Freedom from cloud deployment and maintenance headaches

Pipulate provides the infrastructure so you can focus on SEO logic.

### Agencies & In-House Teams
If your organization needs:
- Consistent SEO workflows across team members
- Better knowledge transfer for complex SEO tasks
- Lower tool costs without sacrificing capabilities
- Privacy for client or proprietary data

Pipulate creates a standardized, guided approach to SEO processes.

## The Pipulate Difference

### Why Local-First Matters

```
      ┌───────────────────────────────┐ # Benefits of Local-First Simplicity
      │          Web Browser          │
      │                               │ - No mysterious client-side state
      │    ┌────────────────────┐     │ - No full-stack framework churn
      │    │   Server Console   │     │ - No complex ORM or SQL layers
      │    │     & Web Logs     │     │ - No external message queues
      │    └─────────┬──────────┘     │ - No build step required
      │              ▼                │ - Direct, observable state changes
      │    ┌─────────────────────┐    │
      │    │  Server-Side State  │    │ 
      │    │  DictLikeDB + JSON  │ ◄─── (Conceptually like server-side cookies)
      │    └─────────────────────┘    │ - Enables the "Know EVERYTHING!" philosophy
      └───────────────────────────────┘
```

**Privacy & Control**: Your SEO data never leaves your machine. No cloud providers can access your competitive intelligence, client data, or proprietary methodologies.

**Performance**: Use your full CPU/GPU power for intensive tasks like large-scale crawling, AI processing, or data analysis without per-use costs or rate limits.

**Reliability**: No internet outages, API downtime, or service discontinuations can interrupt your work.

### Why Workflows Beat Scripts

Traditional SEO scripts require technical knowledge to run and modify. Pipulate transforms these scripts into guided, step-by-step workflows that:

- **Guide Non-Technical Users**: Clear instructions and validation at each step
- **Preserve Expertise**: Document your methodology in a reusable format
- **Enable Collaboration**: Share complex processes without sharing code
- **Maintain Flexibility**: Each step can be customized or extended as needed

### The Magic of Reproducibility

Using Nix Flakes, Pipulate guarantees that your environment works identically across:
- Different operating systems (macOS, Linux, Windows via WSL)
- Different team members' machines
- Different points in time (no "dependency hell")

This means when you create a workflow, it will work reliably for anyone, anywhere.

## Getting Started

Pipulate is designed to be simple to install with just two commands:

1. **Install Nix** (one-time setup):
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```

2. **Install Pipulate**:
   ```bash
   curl -L https://pipulate.com/install.sh | sh
   ```

3. **Run Pipulate**:
   ```bash
   cd ~/pipulate
   nix develop
   ```

That's it! Your browser will open to both Pipulate (localhost:5001) and JupyterLab (localhost:8888).

## Real-World Applications

### SEO Audit Automation
Transform manual audit checklists into guided workflows that:
- Collect site data systematically
- Run technical checks automatically
- Generate consistent reports
- Preserve audit methodology

### Content Analysis Pipelines
Convert content analysis scripts into user-friendly workflows:
- Analyze competitor content at scale
- Generate content briefs with AI assistance
- Track content performance over time
- Identify content gaps and opportunities

### Rank Tracking & Reporting
Build custom rank tracking solutions that:
- Monitor keywords across multiple search engines
- Generate automated reports
- Integrate with other SEO data sources
- Maintain complete data ownership

### Link Building Workflows
Systematize link building processes:
- Prospect identification and qualification
- Outreach template generation
- Response tracking and follow-up
- Campaign performance analysis

## A Philosophy of Simplicity

At its core, Pipulate embraces simplicity — not by sacrificing power, but by carefully choosing technologies that work together elegantly:

- No complex JavaScript frameworks or build systems
- No complicated deployment or cloud infrastructure
- No fragile state management across multiple services

Instead, Pipulate focuses on making SEO workflows explicit, observable, and understandable. Everything is designed to be transparent and straightforward, following our belief that the best tools get out of your way and let you focus on what matters: doing great SEO work.

## The Future of SEO Tools

Pipulate represents a new approach to SEO tooling:

**From SaaS to Self-Hosted**: Own your tools and data completely
**From Scripts to Workflows**: Make technical expertise accessible to everyone
**From Cloud to Local**: Leverage your hardware without ongoing costs
**From Proprietary to Open**: Understand and modify every aspect of your tools

Join us in building a more open, accessible approach to SEO tools — where your data stays yours, and technology serves your needs instead of locking you in.

Ready to try Pipulate? Check out our [installation guide](/install/) to get started in just a few minutes.
