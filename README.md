# Pipulate: Local First AI SEO Software

![Pipulate Free & Open Source SEO with & for LLMs](/static/ai-seo-software.svg)

<!-- Don't forget to sync_ascii_art.py -->
> **Your data. Your AI. Your machine. Your control.**  
> No subscriptions, no vendor lock-in, no cloud costs.

### Meet Chip O'Theseus  <!-- key: pipulate-welcome-banner -->

```
╔═════════════════════════════════════════════════════════════════════════╗  Chip O'What?
║  🎭 PIPULATE: LOCAL-FIRST AI SEO SOFTWARE & DIGITAL WORKSHOP            ║     ,       O  
║  ────────────────────────────────────────────────────────────────────── ║     \\  .  O
║                                                                         ║     |\\/| o
║  💬 Chip O'Theseus: "Welcome to your sovereign computing environment!"  ║     / " '\ 
║                                                                         ║    . .   . 
║  🌟 Where Python functions become HTML elements...                      ║   /    ) | 
║  🌟 Where workflows preserve your creative process...                   ║  '  _.'  |   
║  🌟 Where AI assists without cloud dependencies...                      ║  '-'/    \  
╚═════════════════════════════════════════════════════════════════════════╝  
```

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

--------------------------------------------------------------------------------

## What is Pipulate?

Pipulate is a **local-first, single-tenant desktop app framework** featuring AI-assisted, step-by-step workflows. Designed to feel like an Electron app, it uniquely runs a full, reproducible Linux environment within a project folder using Nix, ensuring consistency across macOS, Linux, and Windows (via WSL).

### Desktop App Architecture: Electron vs Pipulate  <!-- key: desktop-app-architecture-comparison -->

<!-- START_ASCII_ART: desktop-app-architecture-comparison -->
### Desktop App Architecture: Electron vs Pipulate  <!-- key: desktop-app-architecture-comparison -->

<!-- START_ASCII_ART: desktop-app-architecture-comparison -->

```
        🖥️ ELECTRON PATTERN                 🌐 PIPULATE PATTERN
      ═══════════════════════             ═══════════════════════
    
    ┌─────────────────────────┐        ┌─────────────────────────┐
    │      ELECTRON APP       │        │     PIPULATE SETUP      │
    ├─────────────────────────┤        ├─────────────────────────┤
    │ ┌─────┐ ┌─────┐ ┌─────┐ │        │ ┌─────────────────────┐ │
    │ │.exe │ │.dmg │ │.deb │ │        │ │     install.sh      │ │
    │ └─────┘ └─────┘ └─────┘ │        │ │ (Works on ALL OSes) │ │
    │   Per-OS Installers     │        │ └─────────────────────┘ │
    └───────────┬─────────────┘        └───────────┬─────────────┘
                │                                  │
                ▼                                  ▼
    ┌─────────────────────────┐        ┌─────────────────────────┐  This is new.
    │   📱 Native Window      │        │ 🖥️ Terminal Console     │    ,       O
    │  ┌─────────────────┐    │        │ ┌─────────────────────┐ │    \\  .  O
    │  │  Web Browser    │    │        │ │ nix develop         │ │    |\\/| o
    │  │  (Bundled)      │    │        │ │ Starting servers... │ │    / " '\ 
    │  │  ┌───────────┐  │    │        │ │ ✓ JupyterLab ready  │ │   . .   . 
    │  │  │           │  │    │        │ │ ✓ Pipulate ready    │ │  /    ) | 
    │  │  │   HTML    │  │    │        │ └─────────────────────┘ │ '  _.'  |   
    │  │  │   CSS     │  │    │   +    └─────────────────────────┘ '-'/    \  
    │  │  │   JS      │  │    │                    │
    │  │  │           │  │    │                    ▼
    │  │  └───────────┘  │    │        ┌─────────────────────────┐
    │  └─────────────────┘    │        │ 🌐 Regular Browser      │
    │          │              │        │ ┌─────────────────────┐ │
    │          ▼              │        │ │ localhost:5001      │ │
    │ ┌─────────────────┐     │        │ │ ┌─────────────────┐ │ │
    │ │   Node.js       │     │        │ │ │  Python/HTMX    │ │ │
    │ │   Runtime       │     │        │ │ │  Workflows      │ │ │
    │ └─────────────────┘     │        │ │ │  Local AI       │ │ │
    └─────────────────────────┘        │ │ └─────────────────┘ │ │
                                       │ └─────────────────────┘ │
✅ Feels like native app               └─────────────────────────┘
❌ Multiple installers needed           
❌ Platform-specific builds             ✅ Universal installer
❌ Update distribution complexity       ✅ Auto-updates via git
                                        ✅ Same experience all OSes
                                        ✅ Complete reproducibility
```

<!-- END_ASCII_ART: desktop-app-architecture-comparison -->
<!-- END_ASCII_ART: desktop-app-architecture-comparison -->

### The Magnum Opus: Computing Sovereignty  <!-- key: magnum-opus-computing-sovereignty -->

This isn't just another framework — it's a **deliberate culmination** of decades of tech evolution insights. Pipulate represents the "third act" approach to development (3rd time's the charm): choosing the **most durable and lovable** parts of the modern tech stack while rejecting the exhausting hamster wheel of framework churn.

If you are not an Empire builder and prefer craftsmanship over the rat race and want to build tools that last, then Pipulate may be for you. Pipulate embodies that philosophy — maximum creative freedom with minimum technical debt, recapturing *that old Webmaster feeling.*

### Core Philosophy: Local-First, WET, and AI-Augmented

#### Breaking Free: From Framework Churn to Computing Sovereignty  <!-- key: breaking-free-framework-churn -->

<!-- START_ASCII_ART: breaking-free-framework-churn -->
#### Breaking Free: From Framework Churn to Computing Sovereignty  <!-- key: breaking-free-framework-churn -->

<!-- START_ASCII_ART: breaking-free-framework-churn -->

```
🎡 THE HAMSTER WHEEL OF FRAMEWORK CHURN        🏰 COMPUTING SOVEREIGNTY
═══════════════════════════════════════        ═══════════════════════════

    React → Vue → Angular → Svelte             🗽 Your Hardware
         ↑                    ↓                🗽 Your Data  
    Webpack ← Next.js ← Vite ← Remix           🗽 Your AI
         ↑                    ↓                🗽 Your Code
    Docker → K8s → Cloud → Serverless          🗽 Your Schedule
                                               
    😵‍💫 Endless Learning                        ✨ Durable Tools:
    💸 Cloud Dependencies                       • Python (30+ years)
    🔒 Platform Lock-in                         • SQLite (built-in)
    📈 Growing Complexity                       • HTML/HTTP (timeless)
    ⏰ Always Catching Up                       • Nix (reproducible)
                                                • Local AI (private)
         VS.
                                               🎯 Third Act Philosophy:
    🏃‍♂️ JUMP OFF THE WHEEL                       "Choose tools that will
                ↓                               outlast the frameworks"
         ┌─────────────┐                       
         │  PIPULATE   │                       💤 Sleep Well
         │ Local-First │                       🧘 Own Schedule  
         │  Sovereign  │                       🔧 Full Control
         └─────────────┘                       ♾️ Built to Last
```

<!-- END_ASCII_ART: breaking-free-framework-churn -->

- **Local-First & Single-Tenant:** Your data, code, and AI run on your hardware. This guarantees privacy, eliminates cloud costs, and gives you full control.
- **WET Workflows, DRY Framework:** Workflows are intentionally "WET" (explicit & step-by-step) for maximum clarity and customizability—perfectly mirroring Jupyter Notebooks. The underlying framework is "DRY" for efficiency.

- **The AI Advantage:** AI makes WET practical. Tedious code maintenance and refactoring, once a weakness of WET, is now an area where AI excels, turning repetition into a strength for rapid, context-aware development.
- **Simplicity & Observability ("Know EVERYTHING!"):** We reject opaque enterprise patterns. State is managed in transparent SQLite tables and JSON blobs, making the entire system intuitive and debuggable.
- **Reproducibility with Nix:** Nix Flakes provide a perfect, reproducible Linux environment on macOS, Linux, and Windows (WSL), solving the "works on my machine" problem.
- **Future-Proof Stack:** We rely on durable standards: Python, SQLite, HTML, and HTMX. This is a framework built to last.
<!-- END_ASCII_ART: breaking-free-framework-churn -->

- **Local-First & Single-Tenant:** Your data, code, and AI run on your hardware. This guarantees privacy, eliminates cloud costs, and gives you full control.
- **WET Workflows, DRY Framework:** Workflows are intentionally "WET" (explicit & step-by-step) for maximum clarity and customizability—perfectly mirroring Jupyter Notebooks. The underlying framework is "DRY" for efficiency.

- **The AI Advantage:** AI makes WET practical. Tedious code maintenance and refactoring, once a weakness of WET, is now an area where AI excels, turning repetition into a strength for rapid, context-aware development.
- **Simplicity & Observability ("Know EVERYTHING!"):** We reject opaque enterprise patterns. State is managed in transparent SQLite tables and JSON blobs, making the entire system intuitive and debuggable.
- **Reproducibility with Nix:** Nix Flakes provide a perfect, reproducible Linux environment on macOS, Linux, and Windows (WSL), solving the "works on my machine" problem.
- **Future-Proof Stack:** We rely on durable standards: Python, SQLite, HTML, and HTMX. This is a framework built to last.

### Primary Goals

1. **Empower End-Users (e.g., SEO Practitioners):** Enable non-programmers to run powerful, AI-guided workflows (often ported from Jupyter Notebooks) without needing to interact with Python code directly.
2. **Serve Developers:** Provide a simple, reproducible environment for building these workflows, leveraging integrated tooling like Jupyter, local LLMs, and a streamlined web framework.

--------------------------------------------------------------------------------

## The Technical Stack: Simple Yet Powerful

Pipulate's WET philosophy extends to its technology choices, favoring simple, durable tools over complex abstractions:

## *Not On My Machine* Problem Fixed  <!-- key: not-on-my-machine-problem-fixed -->

> The Cloud's popularity has been driven in part by developers not wanting to maintain multiple codebases or installers per OS. Thanks to Nix, that's all fixed.

* **Nix Flakes:** Manages dependencies and creates reproducible environments, ensuring consistency across developers and operating systems, with optional CUDA support. E.g. Is this a Linux-thing you're reading about here? A Windows thing? A Mac thing? The answer is: YES!!! All of the above — and if you've got cool acceleration hardware, it will even take advantage and utilize that too. Best of all worlds.

```
     ____                      _       _                        .--.      ___________
    |  _ \  __ _ _ ____      _(_)_ __ (_)_  __    ,--./,-.     |o_o |    |     |     |
    | | | |/ _` | '__\ \ /\ / / | '_ \| \ \/ /   / #      \    |:_/ |    |     |     |
    | |_| | (_| | |   \ V  V /| | | | | |>  <   |          |  //   \ \   |_____|_____|
    |____/ \__,_|_|    \_/\_/ |_|_| |_|_/_/\_\   \        /  (|     | )  |     |     |
                                                  `._,._,'  /'\_   _/`\  |     |     |
    Solving the "Not on my machine" problem well.           \___)=(___/  |_____|_____|
```

**Nix serves as the "Noah's Ark"** - preserving this perfect focus in a reproducible environment that works identically across all platforms. Once you've locked in the focus, it lasts for years or decades, all bottled up in infrastructure-as-code.

## Other Key Technologies Used

Pipulate integrates a carefully selected set of tools aligned with its philosophy:

* **FastHTML:** A Python web framework prioritizing simplicity. It generates HTML directly from Python objects (no template language like Jinja2) and minimizes JavaScript by design, working closely with HTMX. It's distinct from API-focused frameworks like FastAPI. The Python function-naming *is the HTML-template language.*

### The New LAMP Stack: Evolution in Simplicity  <!-- key: new-lamp-stack-comparison -->

<!-- START_ASCII_ART: new-lamp-stack-comparison -->
### The New LAMP Stack: Evolution in Simplicity  <!-- key: new-lamp-stack-comparison -->

<!-- START_ASCII_ART: new-lamp-stack-comparison -->

```
🏛️ ORIGINAL LAMP STACK (2000s)              🚀 NEW LAMP STACK (2025)
═══════════════════════════════              ═══════════════════════════

┌─────────────────────────────┐              ┌─────────────────────────────┐
│  🐧 L: Linux                │              │  🐧 L: Linux + Nix          │
│     Single OS, manual setup │              │     Reproducible everywhere │
├─────────────────────────────┤              ├─────────────────────────────┤
│  🌐 A: Apache               │              │  ⚡ A: ASGI                  │
│     Static config, restarts │              │     Async, hot reload       │
├─────────────────────────────┤              ├─────────────────────────────┤
│  🗄️ M: MySQL                │              │  📊 M: MiniDataAPI          │
│     Complex queries, joins  │              │     Python-native simplicity│
├─────────────────────────────┤              ├─────────────────────────────┤
│  🔧 P: PHP                  │              │  🐍 P: Python + FastHTML    │
│     Mix of HTML/logic       │              │     + HTMX                  │
└─────────────────────────────┘              └─────────────────────────────┘
              │                                            │
              ▼                                            ▼
    ┌─────────────────────┐                    ┌─────────────────────────┐
    │   🏢 Enterprise     │                    │  🏠 Local-First         │
    │   Complexity        │                    │  Sovereignty            │
    │                     │                    │                         │
    │ • Multi-server      │                    │ • Single machine        │
    │ • Load balancers    │                    │ • Integrated AI         │
    │ • Database clusters │         VS         │ • SQLite simplicity     │
    │ • DevOps overhead   │                    │ • Nix reproducibility   │
    │ • Cloud dependencies│                    │ • Complete ownership    │
    └─────────────────────┘                    └─────────────────────────┘
    
    🎯 One person understands                  🎯 One person controls
       part of the system                         the entire system
```

<!-- END_ASCII_ART: new-lamp-stack-comparison -->

The original LAMP stack was beautiful in its simplicity - one person could understand and manage the whole stack. But it got bloated with enterprise patterns, microservices, and distributed complexity.

Pipulate brings back that **"one person, full stack"** philosophy with modern tools:

- **L**inux + **N**ix: Reproducible environments across all platforms
- **A**SGI: Modern async server interface, future-proofed for performance  
- **M**iniDataAPI: Universal SQL simplifier close to Python's core data structures
- **P**ython + FastHTML + HTMX: The new web development paradigm

This isn't just simpler - it's more powerful, giving you complete environment reproducibility, local AI integration, server-side state management, and future-proofed skills.
<!-- END_ASCII_ART: new-lamp-stack-comparison -->

The original LAMP stack was beautiful in its simplicity - one person could understand and manage the whole stack. But it got bloated with enterprise patterns, microservices, and distributed complexity.

Pipulate brings back that **"one person, full stack"** philosophy with modern tools:

- **L**inux + **N**ix: Reproducible environments across all platforms
- **A**SGI: Modern async server interface, future-proofed for performance  
- **M**iniDataAPI: Universal SQL simplifier close to Python's core data structures
- **P**ython + FastHTML + HTMX: The new web development paradigm

This isn't just simpler - it's more powerful, giving you complete environment reproducibility, local AI integration, server-side state management, and future-proofed skills.

### The Lens Stack: Focused Architecture  <!-- key: the-lens-stack -->

Pipulate's technology choices form **aligned lenses** that focus ideas from abstraction to actualization. Each lens must be **ground and polished** without misaligning the focus:

```
        Universal Translator of                        AI translates
        Spoken Language to Code     ,=\.-----""""^==--
                                   ;;'( ,___, ,/~\;
                                   '  )/>/   \|-,   
    prompts ,--.  from more abstract  | `\ to | " concrete implementation
     ---> ,'    `.         ,--.       "   "   "                             
     --> /        \----->,'    `.       ,--.        ,-.    
  o  -> /  Linux   \--->/  http  \--->,'_hx `.--->,'   `.    ,-.
 /|\   (  HARDWARE  )->( PROTOCOL )->( LINGUA )->( UI/UX )->(APP)->(git)
 / \ -> \   Nix    /--->\  html  /--->`..py ,'--->`.   ,'    `-'  
     --> \        /----->`.    ,'       `--'        `-'   
     ---> `.    ,'         `--'  
            `--'                          through fewest possible lesnses.

  Idea --> Lens#1   -->   Lens#2  -->  Lens#3  -> Lens#4 > Lens#5 > Lens#6
```

We keep lenses minimal, their material either thoroughly pre-trained into the model (Python 3.x, HTMX, etc.) or able to be included in the prompt and easily held in the context window. We've trimmed the cruft — the lens flashes and burrs, and all unnecessary extra lenses (Angular, React, Vue, etc.)

### Grinding Off the Burrs and Flashes  <!-- key: grinding-off-burrs-flashes -->

In lens manufacturing, "flashes" are excess material that squeeze out of molds - unwanted projections that must be ground off. Steve Jobs famously did this twice: adopting Gorilla Glass (grinding off plastic flashes) and rejecting Flash Player (grinding off software bloat).

**Pipulate continues this tradition:**
- **FastHTML**: Grinds off Jinja2 template complexity  
- **HTMX**: Grinds off virtual DOM overhead
- **Local AI**: Grinds off cloud dependencies
- **SQLite**: Grinds off enterprise database complexity

The result: clean, focused tools that do their job without unnecessary cruft.

--------------------------------------------------------------------------------

## From Flask to FastAPI to FastHTML

This is not your father's Python web framework. HTMX changes everything — a marriage made in heaven between Python and the Web, finally turning Python into a first-class citizen for web development. In many use cases such as this one, Python is even preferable to JavaScript in the way it blends Python's formidable ecosystem of packages with workflows.

### The Evolution: Flask → FastAPI → FastHTML  <!-- key: the-evolution-flask-fastapi-fasthtml -->

The revolution isn't just another framework - it's eliminating the template layer entirely:

```
    🍶 FLASK ERA              🚀 FASTAPI ERA            🌐 FASTHTML ERA
    ═══════════════           ═══════════════           ══════════════════
    
    ┌─────────────┐           ┌─────────────┐           ┌─────────────┐
    │   Python    │           │   Python    │           │   Python    │
    │  Functions  │           │  Functions  │           │  Functions  │
    └──────┬──────┘           └──────┬──────┘           └──────┬──────┘
           │                         │                         │
           ▼                         ▼                         ▼
    ┌─────────────┐           ┌─────────────┐           ┌─────────────┐
    │   Jinja2    │           │  Pydantic   │           │    HTMX     │◄─ Over-the-wire
    │  Templates  │           │   Models    │           │  Fragments  │   HTML targeting
    └──────┬──────┘           └──────┬──────┘           └──────┬──────┘   DOM elements
           │                         │                         │
           ▼                         ▼                         ▼
    ┌─────────────┐           ┌─────────────┐           ┌─────────────┐
    │    HTML     │           │    JSON     │           │    HTML     │
    │   Response  │           │   Response  │           │  Elements   │
    └─────────────┘           └─────────────┘           └─────────────┘
           │                         │                         │
           ▼                         ▼                         ▼
    🌐 Full Page Reload     📱 Frontend Framework      🎯 DOM Element Updates
                               (React/Vue/Angular)        def Div() = <div>
                                                          def Button() = <button>
                                                         
    Template files needed    JSON ↔ HTML conversion     Python functions ARE
    Separate languages       Client-side complexity     the template language!
```

**The FastHTML Breakthrough:** Python function names directly become HTML elements, eliminating templates and making the server the single source of truth for UI state.

* **HTMX:** Enables dynamic, interactive UIs directly in HTML via attributes, minimizing the need for custom JavaScript. Pipulate uses it for server-rendered HTML updates — *over the wire HTML*-fragments targeting elements of the DOM directly instead of fragile, performance-reducing, framework-dependent JSON. *THIS* is where you *jump off the tech-churn hamsterwheel* and future-proof yourself.

* **MiniDataAPI:** A lightweight layer for interacting with SQLite and other databases. Uses Python dictionaries for schema definition, promoting type safety without the complexity of traditional ORMs — effectively future-proofing your SQL. You lose fancy *join* capabilities but in exchange get the *Python dict interface* as your main persistent database API forever-forward, enabiling instant swapability between SQLite and PostgreSQL (for example).

* **Ollama:** Facilitates running LLMs locally, enabling in-app chat, workflow guidance, and future automation capabilities while ensuring privacy and avoiding API costs. Your local AI (Chip O'Theseus) learns & grows with you, hopping from hardware to hardware as you upgrade — like a genie in a hermitcrab shell. And if that weren't kooky enough — it knows how to make MCP-calls!!! That's right, your friendly localhost AI Chip O'Theseus is also an *MCP client!* Your linear workflows ain't so linear anymore when a single-step can be: "Go out and do whatever."

* **SQLite & Jupyter Notebooks:** Foundational tools for data persistence and the workflow development process (porting from notebooks to Pipulate workflows). SQLite is built into Python and really all things — the *get-out-of-tech-liability free card* you didn't know you had. And a full JupyterLab instance is installed side-by-side with Pipulate sharing the same Python `.venv` virtual environment (on Nix!!!), so... well... uhm, there are no words. If you know you know.

--------------------------------------------------------------------------------

## How to Install Pipulate

### Quick Start: Be Running in 5 Minutes  <!-- key: quick-start-be-running-in-5-minutes -->

This guide shows you how to install Pipulate using two main commands in your terminal. This works on macOS or on Windows using WSL (Windows Subsystem for Linux) with an Ubuntu (or similar Linux) terminal.

```

    📦 Your Machine            🔧 Add Foundation       🚀 Complete Environment
         Today                       with Nix                 Ready to Go!
                                                          
    ┌─────────────┐             ┌─────────────┐             ┌─────────────┐
    │ Sad Computer│    Step 1   │   🏗️ Nix    │    Step 2   │ 🎯 Pipulate │
    │   Without   │ ──────────► │ Foundation  │ ──────────► │   + AI +    │
    │    Nix😢    │             │  Installed  │             │   Jupyter   │
    └─────────────┘             └─────────────┘             └─────────────┘
                                                                    │
                                                             Step 3 │
                                                                    ▼
                                                             ┌─────────────┐
                                                             │ 🌐 Browser  │
                                                             │    Opens    │
                                                             │Automatically│
                                                             └─────────────┘
    
    Simple as 1-2-3! No Docker, no build steps, no cloud dependencies.
    Everything runs locally with complete privacy and control.
```

**1. Install Nix (One-Time Setup)**

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

**Close your terminal and open a new one after installation.**

**2. Install Pipulate**

With a custom name
```bash
curl -L https://pipulate.com/install.sh | sh -s Botifython
```

Or default installation
```bash
curl -L https://pipulate.com/install.sh | sh
```

**3. Run It**

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

**4. Run It Again!**

1. You can just forcibly exit out of that Terminal it's running from.
2. Open a new Terminal, and once again:

```bash
cd ~/Botifython
nix develop
```

**5. The Big Reset (If Necessary)**

Things sometimes go wrong. This is how you do a full Pipulate reset. This will also delete anything you downloaded with Pipulate. Adjust custom install name to what you used.

```bash
rm -rf ~/Botifython
curl -L https://pipulate.com/install.sh | sh -s Botifython
cd ~/Botifython
nix develop
```

Wait for ***BOTH TABS*** to auto-open in your browser.

### Installation Process Deep Dive  <!-- key: installation-process-diagram -->

Here's what happens behind the scenes during the "magic cookie" installation:

```
User runs install.sh (via curl)           Nix Flake Activation & Transformation
┌──────────────────────────────┐         ┌────────────────────────────────────────────┐
│ 1. Download install.sh       │         │ 5. User runs 'nix develop'                 │
│ 2. Download ZIP from GitHub  │         │ 6. Flake detects non-git directory         │
│ 3. Extract ZIP to ~/AppName  │         │ 7. Flake clones repo to temp dir           │
│ 4. Download ROT13 SSH key    │         │ 8. Preserves app_name.txt, .ssh, .venv     │
│    to .ssh/rot               │         │ 9. Moves git repo into place               │
└─────────────┬────────────────┘         │10. Sets up SSH key for git                 │
              │                          │11. Transforms into git repo                │
              ▼                          │12. Enables auto-update via git pull        │
      ┌─────────────────────────────────────────────────────────────────────────────┐
      │ Result: Fully functional, auto-updating, git-based Pipulate installation    │
      └─────────────────────────────────────────────────────────────────────────────┘
```

--------------------------------------------------------------------------------

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

### 👨‍🍳 The Chef (Developer/Technical User)
* **🔧 Workflow Creators:** Build and customize AI-assisted workflows
* **📓 Jupyter Porters:** Convert notebook experiments into guided applications
* **🔍 Technical SEOs:** Create sophisticated, reusable SEO processes
* **⚙️ System Administrators:** Deploy consistent environments across teams

**What Chefs Get:**
- 🎛️ Complete control over the "recipe" (workflow logic)
- 🔄 Reproducible development environment via Nix
- 🏗️ Simple architecture that's easy to understand and modify
- 🧰 Integrated tooling (Jupyter, local LLM, SQLite)

### 🍽️ The Customer (End User/Non-Technical)
* **📈 SEO Practitioners:** Run powerful workflows without coding
* **✍️ Content Creators:** Use AI-assisted processes for optimization
* **📊 Marketing Teams:** Execute consistent SEO strategies
* **🏢 Business Owners:** Access enterprise-level SEO capabilities

**What Customers Get:**
- 🚶‍♂️ Guided, step-by-step workflow experiences
- 🤖 AI assistance at every step
- 🙈 No need to see or understand the underlying code
- 🎯 Consistent, repeatable results

### 🍝 The Restaurant Analogy
Just as a chef talks about knife techniques while a diner just wants amazing pasta, Pipulate separates the complexity of creation from the simplicity of consumption. Developers craft the workflows, end-users enjoy the results.

--------------------------------------------------------------------------------

## The WET Revolution: Why Explicit Code Wins in the AI Era

Pipulate is built on a radical philosophy that challenges programming orthodoxy: **WET (Write Everything Twice) is better than DRY (Don't Repeat Yourself)** when you have AI to help manage it.

### The Universal API Pattern: From Quarks to Code  <!-- key: universal-api-pattern -->

At every scale of reality, we see the same pattern: **"lumps of stuff" with APIs** that enable interaction. Quarks combine into atoms, atoms into molecules, cells into organisms, individuals into societies. Each level requires the right **granularity** of interface - not so abstract that you lose control, not so granular that you drown in complexity.

**This is the 80/20 rule of existence:** Handle 80% of interactions gracefully with 20% of the API surface, then handle edge cases as needed. Pipulate applies this principle to code architecture.

### Durable vs. Ephemeral: Building on Bedrock  <!-- key: durable-vs-ephemeral -->

The tech industry suffers from "hamster wheel syndrome" - constantly breaking APIs that force migration cycles. React (20+ versions), Node (frequent breaking changes), Angular (complete rewrites). This isn't progress; it's planned obsolescence.

**Pipulate chooses durable foundations:**
- **Linux Kernel**: Version 6 in 30 years
- **Python**: Version 3 in 30 years  
- **HTML**: Version 5 and stable
- **HTTP**: Version 3 and backward compatible

These are the "laws of physics" for software - stable APIs that enable compound growth rather than constant rebuilding.

### Why WET Works Now  <!-- key: why-wet-works-now -->

Traditional development follows DRY principles, creating abstract, complex systems that are hard to understand and modify. But the world has changed:

1. **🔬 Jupyter Notebooks** promote explicit, literate programming
2. **🤖 AI assistants** excel at managing repetitive code  
3. **🏠 Local-first architectures** prioritize clarity over enterprise complexity
4. **🎯 Right Granularity**: WET provides the perfect abstraction level for human AND AI comprehension

```
                               ________________________________
   - Like Notebooks           /                                \
   - Linear Workflows        |  It runs proprietary private AI  |
   - Local & Cloud-free      |  Workflows from your Local PC?!  |
   - Chip O'Theseus included  \________________________________/
                                                              ()   
        HARDWARE PLATFORM             LOCAL BROWSER             O   , Chip O'Theseus
     _______________________       __________ _______             o \\  . 
    |                       |     / Pipulate \Jupyter\__            |\\/|
    | Windows, Mac or Linux |    |  __________________  |   See!    / " '\ - Radical transparency
    |     _____ ___         |    | | App Name   Menu⚙️| |<- - - - -. .   . - MCP tool-call control
    |   _/ Nix \____\_____  |    | |------------------| |         /    ) | - Browser as bot's body
    |  |                  | |    | | Workflow | Local | |        '  _.'  |
    |  |     Pipulate    <---------> -Step #1 | AI🤖  | |        '-'/    \
    |__|  localhost:5001  |_|    | | -Step #2 | Chat  | |      What, no Docker?
       |  (AI on Rails🚂) |      | | -Step #3 | Help▸ | |      What, no React?
       |__________________|      | |__________|_______| |      What, no Cloud?
                                 |______________________| 
```

**WET workflows are:**
- **🔍 Observable**: See exactly what's happening at every step
- **🔧 Customizable**: Modify workflows without breaking abstractions
- **🤖 AI-Friendly**: Clear code that AI assistants can easily understand and maintain
- **🚀 Future-Proof**: Built on durable web standards that won't become obsolete

--------------------------------------------------------------------------------

## Developer Setup & Environment Notes

**Nix Environment Activation:** Always run `nix develop` from the `~/pipulate` directory *before* running any project commands (`python server.py`, `pip install`, etc.) in a new terminal. This ensures you are using the correct dependencies defined in `flake.nix`.

**Interactive vs. Quiet Shell:**

**Standard Shell:** `nix develop` (or `nix develop .#default`) runs the startup script (`run-script` defined in `flake.nix`) with welcome messages and service startup. Ideal for general use.

**Quiet Shell:** `nix develop .#quiet` activates the Nix environment *without* running the full startup script or launching services automatically. It only sets up paths and installs pip requirements. Use this for:
- Running specific commands without starting the servers (e.g., `nix develop .#quiet --command python -c "import pandas"`).
- Debugging or interacting with AI assistants where verbose startup output is undesirable.
- Manually running `run-server` or `run-jupyter` (scripts placed in `.venv/bin` by the `shellHook`).

**Dependencies:** System-level dependencies (Python version, libraries like `gcc`, `zlib`) are managed by `flake.nix`. Python package dependencies are managed by `pip` using `requirements.txt` within the Nix-provided environment.

**Source of Truth:** The `flake.nix` file is the definitive source for the development environment setup.

--------------------------------------------------------------------------------

## Architecture & Key Concepts

Pipulate features a distinct architecture designed for its local-first, simple, and observable nature.

### Architecture Overview Diagram  <!-- key: architecture-overview-diagram -->

This diagram illustrates the high-level components and their interactions:

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

---

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

### Local-First & Single-Tenant Details  <!-- key: local-first-single-tenant-details -->

Pipulate manages all state server-side within the local environment (think *local-server cookies*), avoiding cloud dependencies. This approach offers:
* **Privacy & Control:** Data never leaves the user's machine.
* **Full Resource Access:** Utilize local CPU/GPU freely for intensive tasks (scraping, 24/7 AI processing) at minimal cost.
* **Simplicity:** Eliminates complexities associated with multi-tenancy, cloud deployment, and distributed state.
* **Observability:** State changes (via DictLikeDB/JSON) are transparent and easily logged.

### Local-First State Management Benefits  <!-- key: local-first-state-management-benefits -->

This detailed view shows how Pipulate's local-first architecture eliminates common web development complexities:

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
      │    │  DictLikeDB + JSON  │ ◄───── Conceptually like local-server-side cookies
      │    └─────────────────────┘    │ - Enables the "Know EVERYTHING!" philosophy
      └───────────────────────────────┘
```

### Server-Rendered UI (HTMX)  <!-- key: server-rendered-ui-htmx -->

The UI is constructed primarily with server-rendered HTML fragments delivered via HTMX. This minimizes client-side JavaScript complexity.
* FastHTML generates HTML components directly from Python.
* HTMX handles partial page updates based on user interactions, requesting new HTML snippets from the server.
* WebSockets and Server-Sent Events (SSE) provide real-time updates (e.g., for chat, live development reloading).

```
                        HTMX+Python enables a world-class
                  Python front-end Web Development environment.
                             ┌─────────────────────┐
                             │    Navigation Bar   │  - No template language (like Jinja2)
                             ├─────────┬───────────┤  - HTML elements are Python functions
  Simple Python back-end     │  Main   │   Chat    │  - Minimal custom JavaScript / CSS
  HTMX "paints" HTML into    │  Area   │ Interface │  - No React/Vue/Angular overhead
  the DOM on demand ───────► │         │           │  - No "build" process like Svelte
                             └─────────┴───────────┘  - No virtual DOM, JSX, Redux, etc.
```

--------------------------------------------------------------------------------

## Workflow Patterns & Development

### Pipeline Workflows  <!-- key: pipeline-workflows -->

Designed for porting notebook-style processes, workflows are sequences of steps where the state is managed explicitly at each stage and stored persistently (typically as a JSON blob in the `pipeline` table).
* **Resumable & Interrupt-Safe:** Because each step's completion is recorded, workflows can be stopped and resumed.
* **Explicit State Flow:** Data typically passes from one step's output (`done` field) to the next via the `transform` function, simplifying debugging. Patterned on Unix pipes.
* **Good Training Data:** The structured input/output of each step creates valuable data for potentially fine-tuning models.
* **Proprietary Friendly:** Excellent for proprietary domain-experts and fields (competing academic, finances) who *resist* letting their data flow onto the Web for general AI training.

```
  ┌─────────┐        ┌─────────┐        ┌─────────┐   - Fully customizable steps
  │ Step 01 │─piped─►│ Step 02 │─piped─►│ Step 03 │   - Interruption-safe & resumable
  └─────────┘        └─────────┘        └─────────┘   - Easily ported from Notebooks
       │                  │                  │        - One DB record per workflow run
       ▼                  ▼                  ▼        - Everything stays on your machine
  State Saved        State Saved         Finalized?   - Magnitudes simpler than celery
```

### Run All Cells Pattern  <!-- key: run-all-cells-pattern -->

**The key insight**: Pipulate workflows use a `run_all_cells()` pattern that directly mirrors Jupyter's "Run All Cells" command. This creates an immediate mental model - each workflow step is like a notebook cell, and the system automatically progresses through them top-to-bottom, just like running all cells in a notebook.

```
    📓 JUPYTER NOTEBOOK               🌐 PIPULATE WORKFLOW
    ═══════════════════               ══════════════════════
    
    [ ] Cell 1: Import data          ┌─────────────────────┐
        │                            │  Step 1: Data Input │ 
        ▼                            └──────────┬──────────┘
    [▶] Cell 2: Process data                    │ hx_trigger="load"
        │                                       ▼
        ▼                            ┌─────────────────────┐
    [ ] Cell 3: Generate report      │ Step 2: Processing  │
        │                            └──────────┬──────────┘
        ▼                                       │ hx_trigger="load"  
    [ ] Cell 4: Export results                  ▼
                                     ┌─────────────────────┐
    🎯 "Run All Cells" Button   ═══► │ Step 3: Export      │
       Executes top-to-bottom        └─────────────────────┘
       
       Same mental model, same execution flow!
       But with persistent state and web UI.
```

### LLM Integration (Ollama)  <!-- key: llm-integration-ollama -->

Integration with a local Ollama instance provides AI capabilities without external API calls:
* **Privacy:** Prompts and responses stay local.
* **Cost-Effective:** No per-token charges; run continuously using local resources.
* **Streaming Support:** Real-time interaction via WebSockets.
* **Bounded Context:** Manages conversation history effectively.
* **Tool Calling:** Can interpret structured JSON from the LLM to execute functions.

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

### Multi-OS & CUDA Support (Nix)  <!-- key: multi-os-cuda-support-nix -->

Nix Flakes ensure a consistent environment across Linux, macOS, and Windows (via WSL), optionally leveraging CUDA GPUs if detected.

```
               ┌──────────────────┐
               │  Linux / macOS   │ - Write code once, run anywhere
               │  Windows (WSL)   │ - Consistent dev environment via Nix
               └────────┬─────────┘   - Like cross-OS Homebrew brew install
                        │
                        │ Nix manages dependencies
                        ▼
               ┌──────────────────┐
               │   CUDA Support   │ - Auto-detects NVIDIA GPU w/ CUDA
               │   (if present)   │ - Uses GPU for LLM acceleration
               └──────────────────┘   - Falls back to CPU if no CUDA
```

### UI Layout  <!-- key: ui-layout -->

The application interface is organized into distinct areas:

```
               ┌─────────────────────────────┐
               │         Navigation         ◄── Search, Profiles,
               ├───────────────┬─────────────┤    Apps, Settings
               │               │             │
    Workflow, ──►   Main Area  │    Chat     │
    App UI     │   (Pipeline)  │  Interface ◄── LLM Interaction 
               │               │             │
               └─────────────────────────────┘
```

### UI Component Hierarchy

```
home (Root Component)
    |
    +-- create_outer_container
        |
        +-- create_nav_group
        |   |
        |   +-- create_nav_menu
        |       |
        |       +-- create_profile_menu
        |       +-- create_app_menu
        |
        +-- create_grid_left
            |
        +-- create_notebook_interface (Displays steps/cells)
```

### File Structure

```plaintext
    .
    ├── .cursor                   # Guidelines for AI code editing (if using Cursor)
    ├── .venv/                    # Virtual environment (shared by server & Jupyter)
    ├── data/
    │   └── data.db               # SQLite database
    ├── downloads/                # Default location for workflow outputs (e.g., CSVs)
    ├── helpers/
    │   ├── botify  
    │   │   └── botify_api.ipynb  # Git managed massive example notebook, produces docs
    │   ├── cleanup               # Temporary scripts to help clean up the system
    │   │   └── organize_css.py   # Example of what might be found there
    │   └── create_workflow.py    # Useful workflow production helpers
    ├── logs/
    │   ├── api.log               # Specific API-calls, rotating last-N server runs
    │   └── Botifython.log        # Server logs (useful for debugging / AI context)
    ├── static/                   # JS, CSS, images
    ├── plugins/                  # Workflow plugins
    ├── training/                 # Markdown files for AI context/prompts
    ├── flake.nix                 # Nix flake definition for reproducibility
    ├── LICENSE
    ├── notebook_introduction_local.ipynb  # Editable (non-auto-updating) copy of botify_api.ipynb
    ├── README.md                 # This file
    ├── requirements.txt          # Python dependencies (managed by Nix)
    └── server.py                 # Main application entry point
```

--------------------------------------------------------------------------------

## Critical Implementation Patterns for LLMs

**These patterns are essential for LLMs working with Pipulate and are frequently missed:**

### 1. The Auto-Key Generation Pattern (MOST CRITICAL)  <!-- key: auto-key-generation-pattern -->

<!-- START_ASCII_ART: auto-key-generation-pattern -->
### 1. The Auto-Key Generation Pattern (MOST CRITICAL)  <!-- key: auto-key-generation-pattern -->

<!-- START_ASCII_ART: auto-key-generation-pattern -->

```
📝 AUTO-KEY GENERATION FLOW
┌─────────────┐    POST     ┌─────────────┐    HX-Refresh   ┌─────────────┐
│ Empty Form  │ ──────────► │   Server    │ ──────────────► │ Page Reload │
│ Submit ⏎    │    /init    │  Response   │     Header      │   Trigger   │
└─────────────┘             └─────────────┘                 └─────────────┘
       ▲                                                            │
       │                                                            ▼
┌─────────────┐              ┌─────────────┐                ┌─────────────┐
│ User Hits   │ ◄─────────── │ Auto-Key    │ ◄───────────── │ landing()   │
│ Enter Again │    Ready!    │ Populated   │    Generates   │   Method    │
└─────────────┘              └─────────────┘                └─────────────┘
```

<!-- END_ASCII_ART: auto-key-generation-pattern -->

When a user hits Enter on an empty key field, this specific sequence occurs:

1. **Form Submission**: POSTs to `/{APP_NAME}/init` with empty `pipeline_id`
2. **Server Response**: The `init` method MUST return an `HX-Refresh` response:
   ```python
   if not user_input:
       from starlette.responses import Response
       response = Response('')
       response.headers['HX-Refresh'] = 'true'
       return response
   ```
3. **Page Reload**: HTMX triggers a full page reload
4. **Auto-Key Population**: The `landing()` method calls `pip.generate_pipeline_key(self)` to populate the input field
5. **User Interaction**: User hits Enter again to start the workflow
<!-- END_ASCII_ART: auto-key-generation-pattern -->

When a user hits Enter on an empty key field, this specific sequence occurs:

1. **Form Submission**: POSTs to `/{APP_NAME}/init` with empty `pipeline_id`
2. **Server Response**: The `init` method MUST return an `HX-Refresh` response:
   ```python
   if not user_input:
       from starlette.responses import Response
       response = Response('')
       response.headers['HX-Refresh'] = 'true'
       return response
   ```
3. **Page Reload**: HTMX triggers a full page reload
4. **Auto-Key Population**: The `landing()` method calls `pip.generate_pipeline_key(self)` to populate the input field
5. **User Interaction**: User hits Enter again to start the workflow

### 2. The Chain Reaction Pattern: The `run_all_cells()` Breakthrough

Pipulate uses HTMX-driven step progression powered by the brilliantly named `run_all_cells()` method:

1. **Initial Trigger**: After `init`, the `run_all_cells()` method initializes the workflow just like Jupyter's "Run All Cells"
2. **Perfect Mental Model**: The method name creates immediate understanding - workflows execute top-to-bottom like notebook cells
3. **Step Handlers**: Each step has GET (display) and POST (submit) handlers
4. **Automatic Progression**: Completed steps trigger next step with `hx_trigger="load"`
5. **State Persistence**: Each step stores data in pipeline state
6. **Pedagogical Brilliance**: The naming makes the system instantly intuitive for developers and AI assistants

**Example: The `run_all_cells()` Pattern in Action**

```python
# ✅ CORRECT: Use the run_all_cells() method for workflow initialization
async def init(self, request):
    """Initialize workflow using the run_all_cells pattern"""
    return pip.run_all_cells(app_name, steps)

# ❌ ANTI-PATTERN: Manual placeholder creation
async def init(self, request):
    """Manual approach - harder to understand and maintain"""
    first_step_id = steps[0].id
    return Div(
        Div(id=first_step_id, hx_get=f'/{app_name}/{first_step_id}', hx_trigger='load'),
        id=f"{app_name}-container"
    )
```

The `run_all_cells()` method encapsulates the workflow initialization pattern and creates an immediate mental connection to Jupyter notebooks.

### 3. APP_NAME vs. Filename Distinction  <!-- key: app-name-vs-filename -->

<!-- START_ASCII_ART: app-name-vs-filename -->
### 3. APP_NAME vs. Filename Distinction  <!-- key: app-name-vs-filename -->

<!-- START_ASCII_ART: app-name-vs-filename -->

```
📂 FILENAME vs APP_NAME DISTINCTION
┌─────────────────────────────────────────────────────────────┐
│                    CRITICAL SEPARATION                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  📁 FILENAME: 200_workflow_genesis.py                       │
│      ├── 🌐 Determines public URL: /workflow_genesis        │
│      └── 📊 Controls menu order: 200                        │
│                                                             │
│  🏷️  APP_NAME: "workflow_genesis_internal"                  │ 
│      ├── 💾 Database table identifier                       │
│      ├── 🔒 MUST REMAIN STABLE (data integrity)             │
│      └── 🚫 NEVER change after deployment                   │
│                                                             │
│  ⚠️  DANGER: Changing APP_NAME = Orphaned Data              │
└─────────────────────────────────────────────────────────────┘
```

<!-- END_ASCII_ART: app-name-vs-filename -->

**Critical for data integrity:**

* **Filename** (e.g., `200_workflow_genesis.py`): Determines public URL endpoint and menu ordering
* **APP_NAME Constant** (e.g., `APP_NAME = "workflow_genesis_internal"`): Internal identifier that MUST REMAIN STABLE
<!-- END_ASCII_ART: app-name-vs-filename -->

**Critical for data integrity:**

* **Filename** (e.g., `200_workflow_genesis.py`): Determines public URL endpoint and menu ordering
* **APP_NAME Constant** (e.g., `APP_NAME = "workflow_genesis_internal"`): Internal identifier that MUST REMAIN STABLE

### 4. State Management via DictLikeDB

* State stored as JSON blobs in pipeline table
* Accessed via `pip.get_step_data()` and `pip.set_step_data()`
* All state changes are transparent and observable

### 5. Plugin Discovery System  <!-- key: plugin-discovery-system -->

<!-- START_ASCII_ART: plugin-discovery-system -->
### 5. Plugin Discovery System  <!-- key: plugin-discovery-system -->

<!-- START_ASCII_ART: plugin-discovery-system -->

```
📁 PLUGIN DISCOVERY SYSTEM
plugins/
├── 010_introduction.py        ✅ Registered as "introduction" (menu order: 1)
├── 020_profiles.py           ✅ Registered as "profiles" (menu order: 2) 
├── hello_flow (Copy).py      ❌ SKIPPED - Contains "()"
├── xx_experimental.py        ❌ SKIPPED - "xx_" prefix
└── 200_workflow_genesis.py   ✅ Registered as "workflow_genesis" (menu order: 20)

    📊 AUTO-REGISTRATION RULES:
    ✅ Numeric prefix → Menu ordering + stripped for internal name
    ❌ Parentheses "()" → Development copies, skipped
    ❌ "xx_" prefix → Work-in-progress, skipped
    🔧 Must have: landing() method + name attributes
    💉 Auto dependency injection via __init__ signature
```

<!-- END_ASCII_ART: plugin-discovery-system -->

* Files in `plugins/` directory are auto-discovered
* Numeric prefixes control menu ordering
* Classes must have `landing` method and name attributes
* Automatic dependency injection based on `__init__` signature
<!-- END_ASCII_ART: plugin-discovery-system -->

* Files in `plugins/` directory are auto-discovered
* Numeric prefixes control menu ordering
* Classes must have `landing` method and name attributes
* Automatic dependency injection based on `__init__` signature

## Workflow Development Helper Scripts

Pipulate includes sophisticated helper scripts for workflow development:

### `create_workflow.py`
Creates new workflows from templates:
```bash
python create_workflow.py workflow.py MyWorkflow my_workflow \
  "My Workflow" "Welcome message" "Training prompt" \
  --template trifecta --force
```

### `splice_workflow_step.py`
Adds steps to existing workflows:
```bash
python splice_workflow_step.py workflow.py --position top
python splice_workflow_step.py workflow.py --position bottom
```

### Template System  <!-- key: workflow-template-system -->

<!-- START_ASCII_ART: workflow-template-system -->
### Template System  <!-- key: workflow-template-system -->

<!-- START_ASCII_ART: workflow-template-system -->

```
🏗️ WORKFLOW TEMPLATE SYSTEM
┌─────────────────┐              ┌─────────────────┐
│  BLANK TEMPLATE │              │TRIFECTA TEMPLATE│
├─────────────────┤              ├─────────────────┤
│ ┌─────────────┐ │              │ ┌─────────────┐ │
│ │   Step 1    │ │              │ │   Step 1    │ │
│ │  (Minimal)  │ │              │ │  (Input)    │ │
│ └─────────────┘ │     VS       │ └──────┬──────┘ │
│                 │              │        │        │
│ Quick Start     │              │        ▼        │
│ Single Purpose  │              │ ┌─────────────┐ │
└─────────────────┘              │ │   Step 2    │ │
                                 │ │ (Process)   │ │
create_workflow.py               │ └──────┬──────┘ │
--template blank                 │        │        │
                                 │        ▼        │
                                 │ ┌─────────────┐ │
                                 │ │   Step 3    │ │
                                 │ │  (Output)   │ │
                                 │ └─────────────┘ │
                                 │                 │
                                 │ Full Pattern    │
                                 │ Complete Flow   │
                                 └─────────────────┘
                                 
                                 create_workflow.py
                                 --template trifecta
```

<!-- END_ASCII_ART: workflow-template-system -->

* `blank`: Minimal workflow with one step
* `trifecta`: Three-step workflow pattern
* Automatic method generation and insertion
<!-- END_ASCII_ART: workflow-template-system -->

* `blank`: Minimal workflow with one step
* `trifecta`: Three-step workflow pattern
* Automatic method generation and insertion

## Common LLM Implementation Mistakes  <!-- key: llm-implementation-mistakes -->

<!-- START_ASCII_ART: llm-implementation-mistakes -->
## Common LLM Implementation Mistakes  <!-- key: llm-implementation-mistakes -->

<!-- START_ASCII_ART: llm-implementation-mistakes -->

```
🚨 LLM IMPLEMENTATION MISTAKE PREVENTION
┌────────────────────────────────────────────────────────────┐
│                    COMMON PITFALLS                         │
├────────────────────────────────────────────────────────────┤
│ ❌ Missing HX-Refresh      │ ✅ if not user_input:         │
│    Response                │     response.headers['HX-     │
│                            │     Refresh'] = 'true'        │
├────────────────────────────┼───────────────────────────────┤
│ ❌ Wrong Key Generation    │ ✅ pip.generate_pipeline_     │
│    Method                  │     key(self)                 │
├────────────────────────────┼───────────────────────────────┤
│ ❌ Broken Chain Reaction   │ ✅ hx_trigger="load" →        │
│    Pattern                 │     Automatic progression     │
├────────────────────────────┼───────────────────────────────┤
│ ❌ APP_NAME Changes        │ ✅ NEVER modify after         │
│    (Data Orphaning)        │     deployment                │
└────────────────────────────────────────────────────────────┘
```

<!-- END_ASCII_ART: llm-implementation-mistakes -->

**LLMs frequently make these errors:**

1. **Missing HX-Refresh Response**: Forgetting to return the refresh response for empty keys
2. **Incorrect Key Generation**: Not using `pip.generate_pipeline_key(self)` properly
3. **Missing Cursor Positioning**: Forgetting the `_onfocus` attribute for user experience
4. **Wrong Route Handling**: Not understanding the difference between landing page and init routes
5. **State Inconsistency**: Not properly handling the key generation and storage flow
6. **APP_NAME Changes**: Modifying APP_NAME after deployment, orphaning existing data
7. **Chain Reaction Breaks**: Not properly implementing the HTMX step progression pattern
<!-- END_ASCII_ART: llm-implementation-mistakes -->

**LLMs frequently make these errors:**

1. **Missing HX-Refresh Response**: Forgetting to return the refresh response for empty keys
2. **Incorrect Key Generation**: Not using `pip.generate_pipeline_key(self)` properly
3. **Missing Cursor Positioning**: Forgetting the `_onfocus` attribute for user experience
4. **Wrong Route Handling**: Not understanding the difference between landing page and init routes
5. **State Inconsistency**: Not properly handling the key generation and storage flow
6. **APP_NAME Changes**: Modifying APP_NAME after deployment, orphaning existing data
7. **Chain Reaction Breaks**: Not properly implementing the HTMX step progression pattern

## Key Design Guidelines & Patterns

These "speedbumps" reinforce Pipulate's core philosophy:

  * **Local vs. Enterprise Mindset:** Embrace local-first simplicity. Avoid patterns designed for distributed, multi-tenant systems.
  * **JSON State Management (Workflows):** Keep workflow state in self-contained steps within a single JSON blob per run. Avoid complex state machines or external step tracking.
  * **Database (MiniDataAPI):** Use the simple schema definition and access patterns provided. Avoid heavy ORMs.
  * **Workflow Pattern:** Ensure workflows are linear and state is explicitly passed or saved at each step. Avoid complex async task chaining that obscures state.
  * **UI Rendering Pattern:** Generate HTML directly from Python components via FastHTML. Avoid template engines.
  * **WebSocket Pattern:** Use the dedicated `Chat` class for managing LLM interactions. Avoid raw WebSocket handling elsewhere.
  * **Workflow Progression Pattern:** Workflows use an explicit chain reaction pattern with `hx_trigger="load"` to manage step progression. This pattern must be preserved exactly as implemented. See the workflow documentation for details.

## Internal Components  <!-- key: core-concepts-internal-components -->

  * **Monitoring:** A file system watchdog monitors code changes. Valid changes trigger an automatic, monitored server restart via Uvicorn, facilitating live development.

```
        ┌─────────────┐         ┌──────────────┐
        │ File System │ Changes │  AST Syntax  │ Checks Code
        │  Watchdog   │ Detects │   Checker    │ Validity
        └──────┬──────┘         └───────┬──────┘
               │ Valid Change           │
               ▼                        ▼
 ┌───────────────────────────┐     ┌──────────┐
 │    Uvicorn Server         │◄─── │  Reload  │ Triggers Restart
 │ (Handles HTTP, WS, SSE)   │     │ Process  │
 └───────────────────────────┘     └──────────┘
```

### Pipeline State Inspector & MCP Tools  <!-- key: pipeline-state-inspector -->

The system provides comprehensive debugging and state inspection capabilities through MCP tools and real-time monitoring:

```
📊 PIPELINE STATE INSPECTOR
├─── 🔍 Discovering active workflows...
├─── ⚡ Found 3 running processes
├─── 🎯 Step 2/5: Processing data transformations
└─── ✨ Ready for next interaction!

🤖 MCP TOOL CALLS
├─── 📡 Connecting to Botify API...
├─── 🔐 Authentication successful
├─── 📊 Fetching schema (4,449 fields discovered!)
└─── 💾 Caching results for lightning-fast access
```

-----

## The Deeper Philosophy: Why This Matters  <!-- key: deeper-philosophy -->

Pipulate represents more than technology choices - it's a statement about **computing sovereignty** and the future of human-AI collaboration.

### The Bootstrap Paradox Solved  <!-- key: bootstrap-paradox-solved -->

How do you "lift yourself up by your bootstraps"? The answer: **you're not a closed system**. Humans interact with reality through interfaces, just like software components. We are "human apps with reality APIs."

This pattern repeats at every scale - from quantum fields to societies. The art lies in choosing the **right granularity** for these interfaces. Too abstract, and you lose control. Too granular, and you drown in complexity.

### Every API is a Compromise  <!-- key: every-api-is-compromise -->

The most successful APIs are **durable** - they become the "laws of physics" for their domain. In reality: the laws of physics, chemistry, biology. In tech: logic gates, operating systems, protocols like HTTP and HTML.

Pipulate chooses these durable APIs deliberately, creating a **future-proof foundation** for AI-assisted development that will outlast the current framework churn.

### Writing for the Future  <!-- key: writing-for-future -->

This documentation serves multiple audiences: humans seeking immediate productivity, and AI systems learning to collaborate with human creativity. The explicit, observable nature of Pipulate workflows creates **perfect training data** for the next generation of AI assistants.

## Final Thoughts

Pipulate offers a unique approach to building local, AI-assisted applications, prioritizing simplicity, user control, and reproducibility over conventional scaling patterns. By understanding its core concepts and embracing its philosophy, developers can create powerful workflows, and end-users can benefit from AI guidance without cloud dependencies.

Remember the guiding principles:

1.  **Keep it simple.**
2.  **Stay local and single-user.**
3.  **Embrace the unconventional.**
4.  **Choose durable foundations over ephemeral frameworks.**
5.  **Build for both human creativity and AI collaboration.**

-----

## Developer's Notes

### The Pipulate Workshop

The repository includes not only polished plugins but also experimental scripts and notebooks under development (e.g., in the root directory or marked with `xx_` prefix in plugin directories). These represent ongoing work and exploration.

### Plugin Development Conventions

#### Auto-Registration Behavior

  * **Numeric Prefixes:** Files like `workflows/10_hello_flow.py` are registered as `hello_flow` (number stripped for internal name, used for menu order).
  * **Parentheses Skip:** Files with `()` in the name (e.g., `hello_flow (Copy).py`) are skipped – useful for temporary copies during development.
  * **`xx_` Prefix Skip:** Files prefixed with `xx_` (e.g., `xx_experimental_flow.py`) are skipped – useful for keeping unfinished work in the plugin directories without activating it.

#### Workflow for Creating New Plugins

1.  **Copy:** Copy a template to `my_flow (Copy).py`.
2.  **Modify:** Develop your workflow. It won't auto-register yet.
3.  **Test:** Rename to `xx_my_flow.py`. The server should auto-reload. Test thoroughly.
4.  **Deploy:** Rename to `##_my_flow.py` to assign menu order and activate.

#### Git History Considerations

Use `git mv` for simple renames (like `xx_` to numbered prefix) to preserve history. Document more complex renames in commit messages.

```bash
git mv workflows/xx_my_flow.py workflows/##_my_flow.py
git commit -m "Feat: Promote workflow xx_my_flow.py to ##_my_flow.py"
```

-----

## Roadmap

**Core & Workflow Enhancements:**

  * Dev, Test, and Prod database switching
  * Saving source HTML and rendered DOM of any URL
  * Botify data export CSV save (incorporating robust polling)
  * Full web form field support (textarea, dropdown, checkboxes, radio buttons)
  * Generic support for Anywidgets
  * Utility for deleting garbage tables from plugin experimentation

**AI / LLM Integration:**

  * LLM inspection of any local data object (RAG-style functionality)
  * Various memory types for LLM context (vector embedding, graph, key/val-store)
  * Enabling the local LLM to be an MCP Client

**Automation & External Interaction:**

  * MCP Server for automated web browsing and similar tasks

-----

## Included PrismJS Highlighting

THEMES
- Okaidia ocodia 1.77KB

LANGUAGES
- CSS1.71KB
- Markup + HTML + XML + SVG + MathML + SSML + Atom + RSS4.64KB
- C-like0.83KB
- JavaScript6.18KB
- Bash + Shell + Shell zeitgeist87 8.96KB
- Diff uranusjr 1.33KB
- JSON + Web App Manifest CupOfTea696 0.58KB
- JSON5 RunDevelopment 0.52KB
- JSONP RunDevelopment 0.23KB
- Liquid cinhtau 2.56KB
- Lua Golmote 0.74KB
- Markdown Golmote 10.43KB
- Markup templating
- Mermaid RunDevelopment 3.03KB
- Nix Golmote 1.47KB
- Python multipetros 2.45KB
- Regex RunDevelopment 2.33KB
- YAML hason 3.11KB

PLUGINS
- Line Highlight11.66KB
- Line Numbers kuba-kubula 7.23KB
- Toolbar mAAdhaTTah 5.63KB

## Contributing

Contributions are welcome\! Please adhere to the project's core philosophy:

  * Maintain Local-First Simplicity (No multi-tenant patterns, complex ORMs, heavy client-side state).
  * Respect Server-Side State (Use DictLikeDB/JSON for workflows, MiniDataAPI for CRUD).
  * Preserve the Workflow Pipeline Pattern (Keep steps linear, state explicit).
  * Honor Integrated Features (Don't disrupt core LLM/Jupyter integration unless enhancing local goals).

-----

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

