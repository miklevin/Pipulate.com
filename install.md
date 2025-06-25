---
title: Install Pipulate
description: Get up and running with Pipulate in 5 minutes
permalink: /install/
group: install
---

# Install Pipulate: Be Running in 5 Minutes

Get started with the local-first revolution. Two commands and you're running.

---

## Quick Start Guide

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

### 3. Run It

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

<!-- START_ASCII_ART: 2-install-pipulate -->

<!-- END_ASCII_ART: 2-install-pipulate -->

### Force Restart

If you need to force-close everything:

1. Press `Ctrl+C` repeatedly until the terminal exits
2. Close the terminal window
3. Open a new terminal
4. `cd ~/pipulate && nix develop`

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
```
     ____                      _       _                        .--.      ___________
    |  _ \  __ _ _ ____      _(_)_ __ (_)_  __    ,--./,-.     |o_o |    |     |     |
    | | | |/ _` | '__\ \ /\ / / | '_ \| \ \/ /   / #      \    |:_/ |    |     |     |
    | |_| | (_| | |   \ V  V /| | | | | |>  <   |          |  //   \ \   |_____|_____|
    |____/ \__,_|_|    \_/\_/ |_|_| |_|_/_/\_\   \        /  (|     | )  |     |     |
                                                  `._,._,'  /'\_   _/`\  |     |     |
    Solving the "Not on my machine" problem well.           \___)=(___/  |_____|_____|
```
<!-- END_ASCII_ART: not-on-my-machine-problem-fixed -->

<!-- START_ASCII_ART: multi-os-cuda-support-nix -->
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
<!-- END_ASCII_ART: multi-os-cuda-support-nix -->

---

## Next Steps

Once installed, explore:

1. **[The WET Blueprint](/guide/wet-blueprint/)** - Understanding the philosophy
2. **[Local-First Revolution](/guide/local-first-revolution/)** - Why it matters
3. **[Building Workflows](/guide/chain-reaction-pattern/)** - Hands-on development
4. **[GitHub Repository](https://github.com/miklevin/pipulate)** - Source code and community

---

## Need Help?

- **[Complete Guide](/guide/)** - Step-by-step tutorials
- **[GitHub Issues](https://github.com/miklevin/pipulate/issues)** - Bug reports and questions
- **[Development Notes](/development/)** - Technical details

**Welcome to the local-first revolution!**
```
