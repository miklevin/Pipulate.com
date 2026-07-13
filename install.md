---
title: Install Pipulate
description: Get up and running with Pipulate in 5 minutes
permalink: /install/
group: install
---

# Install Pipulate: Be Running in 5 Minutes

Get started with the local-first revolution. Two commands and you're running.

---

## Main Installation Plan

```bash
# 1. Install Pipulate (one-time setup)
curl -fsSL https://pipulate.com/install.sh | bash -s TestProject
```

> **Note:** Nix creates a perfectly reproducible environment, like Docker but more integrated. The first setup might take a few minutes to download dependencies, but subsequent launches are fast.

```bash
# 2. Launch it
cd ~/TestProject && nix develop
```

**What you get:** A local web app at `http://localhost:5001` with step-by-step workflows, integrated AI chat, and a JupyterLab instance at `http://localhost:8888`. No cloud required.

**Success looks like:** The JupyterLab tab auto-opens in your browser. Run the Onboarding notebook top-to-bottom to unlock the Pipulate app (it opens automatically on future launches).

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
cd ~/TestProject
nix develop
```

### 5. The Big Reset (If Necessary)

Things sometimes go wrong. This is how you do a full Pipulate reset. This will also delete anything you downloaded with Pipulate. Adjust custom install name to what you used.

```bash
rm -rf ~/TestProject
curl -fsSL https://pipulate.com/install.sh | bash -s TestProject
cd ~/TestProject
nix develop
```

Wait for the JupyterLab tab to auto-open, then run the Onboarding notebook to unlock the Pipulate app.


### Installation Strategy: Universal First, PyPI Alternative

We offer two installation paths that lead to the exact same robust, Nix-managed environment. Choose the path that best fits your experience level and preferences.

```text
                            ┌────────────────────────────┐
                            │      New User on macOS     │
                            └─────────────┬──────────────┘
                                          │
                  ┌───────────────────────┴───────────────────────┐
                  │                                               │
                  ▼                                               ▼
  ┌──────────────────────────────────┐   ┌───────────────────────────────────────────┐
  │ PATH 1: Recommended for Everyone │   │ PATH 2: Alternative for Python Developers │
  └──────────────────────────────────┘   └───────────────────────────────────────────┘
                  │                                               │
  "I want the simplest, most               "I prefer managing my command-line
   direct way to get this running."        tools with standard Python utilities."
                  │                                               │
                  ▼                                               ▼
  1. `curl ... [nix]`                      1. `brew install pipx` (If needed)
  2. `curl ... [pipulate]`                 2. `pipx install pipulate`
                                           3. `pipulate install`
                  │                                               │
                  └───────────────┐               ┌───────────────┘
                                  │               │
                                  ▼               ▼
                            ┌────────────────────────────┐
                            │    Nix-Managed Pipulate    │
                            │        Environment         │
                            └────────────────────────────┘
                                         ||
                                    (Identical
                                      Result)
```

### PATH 1: Quick Start — Universal Installation (Recommended)

This is the fastest and most universal way to install Pipulate. It has the fewest dependencies and works on any modern Mac, Linux system, or Windows with WSL.

```text

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

    Simple as 1-2-3! No Docker, no build steps, works with or without cloud services.
Everything runs locally with complete flexibility and control.
```

### Force Restart

If you need to force-close everything:

1. Press `Ctrl+C` repeatedly until the terminal exits
2. Close the terminal window
3. Open a new terminal
4. `cd ~/TestProject && nix develop`

### Uninstalling Nix

To remove Nix completely from your system:

```bash
/nix/nix-installer uninstall
```

---

## System Requirements

- **macOS**: 10.15 or later
- **Linux**: Most modern distributions
- **Windows**: WSL2 with Ubuntu 20.04+
- **Memory**: 8GB RAM recommended
- **Storage**: 2GB free disk space

---

## What Gets Installed

The Nix environment includes:
- **Python 3.12** with all required packages
- **JupyterLab** for development and experimentation  
- **Local LLM support** via Ollama
- **All system libraries** needed for web scraping, data processing, and AI
- **FastHTML + HTMX** for web development
- **Complete isolation** from your system's Python installation

## About Nix

Pipulate uses Nix to ensure a **consistent, reproducible environment** across all operating systems:

- **Identical Environments**: Same Python version, packages, and libraries on every machine
- **No Conflicts**: Completely isolated from your system's Python  
- **Easy Updates**: One command updates everything
- **Cross-Platform**: Works identically on macOS, Linux, and Windows (WSL)

This eliminates the "works on my machine" problem and ensures Pipulate runs reliably everywhere.

<!-- START_ASCII_ART: not-on-my-machine-problem-fixed -->
## *Not On My Machine* Problem Fixed  <!-- key: not-on-my-machine-problem-fixed -->

> The Cloud's popularity has been driven in part by developers not wanting to maintain multiple codebases or installers per OS. Thanks to Nix, that's all fixed.

* **Nix Flakes:** Manages dependencies and creates reproducible environments, ensuring consistency across developers and operating systems, with optional CUDA support. Do you remember *normalize.css* from the wild web that made all browsers show webpages the same? Nix is *normalized Linux* so all Macs, Windows and other Linuxes run your distributed app exactly the same.

```
                                                      .--.      ___________
      _      http://levinix.com         ,--./,-.     |o_o |    |     |     |
     | |    _____   _(_)_ __ (_)_  __  / #      \    |:_/ |    |     |     |
     | |   / _ \ \ / / | '_ \| \ \/ / |          |  //   \ \   |_____|_____|
     | |__|  __/\ V /| | | | | |>  <   \        /  (|     | )  |     |     |
     |_____\___| \_/ |_|_| |_|_/_/\_\   `._,._,'  /'\_   _/`\  |     |     |
                                                  \___)=(___/  |_____|_____|

```

**Nix serves as the "Noah's Ark"** creating easily re-hydrated environments that work identically across all platforms and forever into the future. The long promised Holy Grail of *write-once run anywhere* is today achieved with *infrastructure-as-code* (IaC) leveraging a fully featured generic *normalized Linux* called Nix.
<!-- END_ASCII_ART: not-on-my-machine-problem-fixed -->

<!-- START_ASCII_ART: multi-os-cuda-support-nix -->
### Multi-OS & CUDA Support (Nix)

Nix Flakes ensure a consistent environment across Linux, macOS, and Windows (via WSL), optionally leveraging CUDA GPUs if detected.

```
               ┌──────────────────┐
               │  Linux / macOS   │ - Write code once, run anywhere
               │  Windows (WSL)   │ - Consistent dev environment via Nix
               └────────┬─────────┘ - As if Homebrew but across all OSes
                        │
                        │ Nix manages dependencies
                        ▼
               ┌──────────────────┐
               │   CUDA Support   │ - Auto-detects NVIDIA GPU w/ CUDA
               │   (if present)   │ - Uses GPU for LLM acceleration
               └──────────────────┘ - Falls back to CPU if no CUDA
```
<!-- END_ASCII_ART: multi-os-cuda-support-nix -->

---

## Next Steps

Once installed, use the repository as the source of truth:

1. **[Repository README](https://github.com/miklevin/pipulate/blob/main/README.md)** - Complete overview, philosophy, usage notes, and developer guidance
2. **[GitHub Repository](https://github.com/miklevin/pipulate)** - Source code and project history
3. **[GitHub Issues](https://github.com/miklevin/pipulate/issues)** - Bug reports and questions

---

## Need Help?

- **[Repository README](https://github.com/miklevin/pipulate/blob/main/README.md)** - Canonical documentation
- **[GitHub Issues](https://github.com/miklevin/pipulate/issues)** - Bug reports and questions

**Welcome to the local-first revolution!**
```
