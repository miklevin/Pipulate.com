---
title: Pipulate
description: Pipulate Free and Open Source SEO Software
permalink: /
group: home
---

# Pipulate Installation Guide

Pipulate is a *simpler alternative* to using Jupyter Notebooks for SEO automation. It lets you create step-by-step workflows that run locally on your machine, without needing to write Python code. Think of it as Jupyter Notebooks, but designed specifically for SEO practitioners who want to automate their work without becoming developers.

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
* **Important:** After installation completes, close your terminal and open a new one

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
