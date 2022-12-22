---
title: FOSS SEO Awesome List
description: Free and Open Source SEO Awesome List
permalink: /software/
group: software
---

# FOSS SEO Software

## Installing Pipulate

Pipulate is a Linux server that runs in the background under Windows Subsystem
for Linux through JupyterLab and Linux systemd services. To install Pipulate,
use the
<a href="https://raw.githubusercontent.com/miklevin/drinkme/main/install.bat">Drink Me</a>
install script.

## Local Jupyter vs. Google Colab, Azure Notebooks, Binder, etc.

Many people start Python SEO explorations in Jupyter Notebooks, which simply
means through a Web browser. This is where most people fall into the trap of
using Notebooks cloud providers like Google Colab, Azure Notebooks, Binder or
one of the other cloud providers, resulting in the inability to do Browser
automation, control your IP, install certain packages, and a general loss of
control over your own destiny. Avoid this trap.

### Jupyter Notebooks vs. Linux Services

Anything you "mock up" in a Jupyter Notebook can be cleaned up and moved over
to a Linux service for running 24x7. Because Jupyter installs directly onto
your local Windows 10 or 11 laptop using the Windows Subsystem for Linux, the
code is generally copy/paste-able directly into a Linux Service. Better still,
with the use of tools like nbdev, you don't even need to copy/paste. Your
Notebook is capable of outputting (and updating) a Linux service file in
location. Run it in the Notebook until you're satisfied, nbdev_export, and your
Linux services are updated.



