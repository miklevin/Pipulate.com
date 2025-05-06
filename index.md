---
title: Pipulate
description: Pipulate Free and Open Source SEO Software
permalink: /
group: home
---

<div style="text-align: center;">
  <img src="/pipulate.svg" alt="Pipulate Free & Open Source SEO with & for LLMs">
</div>

# Pipulate Installation Guide

Pipulate is free and open source SEO software that can be installed in just a few steps on macOS or Linux (including Windows via WSL).

## Complete Installation Process

### 1. Install Nix (One-Time Setup)

First, install the Nix package manager:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

* Follow the on-screen prompts (type "Yes" when asked)
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
