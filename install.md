---
title: Install Pipulate
description: Get up and running with Pipulate in 5 minutes
permalink: /install/
group: install
---

# Install Pipulate: Be Running in 5 Minutes

Get started with the local-first revolution. Two commands and you're running.

---

## Quick Install

### 1. Install Nix (One-Time Setup)

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

**Important:** Close your terminal completely and open a new one after installation.

### 2. Install Pipulate

```bash
# Default installation  
curl -L https://pipulate.com/install.sh | sh

# Or with a custom name
curl -L https://pipulate.com/install.sh | sh -s MyProject
```

### 3. Start Building

```bash
cd ~/pipulate && nix develop
```

This command:
- ✅ Updates to the latest version automatically
- ✅ Starts JupyterLab and the Pipulate server
- ✅ Opens web interfaces in your browser  
- ✅ Provides a complete, reproducible development environment

**That's it!** You now have a local-first development environment with AI integration.

<!-- START_ASCII_ART: 2-install-pipulate -->
```

Or default installation
```
<!-- END_ASCII_ART: 2-install-pipulate -->

---

## System Requirements

- **macOS**: 10.15 or later
- **Linux**: Most modern distributions
- **Windows**: WSL2 with Ubuntu 20.04+
- **Memory**: 8GB RAM recommended
- **Storage**: 2GB free disk space

---

## Troubleshooting

### Running Pipulate Again

After installation, start Pipulate anytime with:

```bash
cd ~/pipulate && nix develop
```

### If Something Goes Wrong

1. **Close the terminal completely** and open a new one
2. Navigate to your Pipulate directory: `cd ~/pipulate`
3. Try again: `nix develop`

### Force Restart

If you need to force-close everything:

1. Press `Ctrl+C` repeatedly until the terminal exits
2. Close the terminal window
3. Open a new terminal
4. `cd ~/pipulate && nix develop`

### Reinstalling Pipulate

To start fresh:

```bash
# Remove the existing installation
rm -rf ~/pipulate

# Reinstall
curl -L https://pipulate.com/install.sh | sh
```

### Uninstalling Nix

To remove Nix completely from your system:

```bash
/nix/nix-installer uninstall
```

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