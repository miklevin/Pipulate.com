---
title: FOSS SEO Awesome List
permalink: /software/
group: software
description: FOSS SEO Software
---

# {{ page.description }}

## Installing Pipulate

Pipulate is a Linux server that runs in the background under Windows Subsystem
for Linux (WSL) through JupyterLab and Linux systemd services. Once Pipulate is
installed, you will have access to JupyterLab on your local machine at <a
href="http://localhost:8080">localhost:8080</a> with a number of pre-installed
Python packages for such tasks as:

- Crawling websites
- Automating Web browsers
- Scraping search results
- Pulling data from Google Analytics 
- Pulling data from Google Search Console
- Emailing yourself screenshots and reports

Each of these Notebooks can be run on-demand and interactively through
JupyterLab, but also can be turned into a scheduled automated task running in
the background of your computer exactly as it would on a server. The Pipulate
experience so that you can turn almost anything that runs Linux and has a
network connection into a Pipulate server.

To install Pipulate, <a href="https://raw.githubusercontent.com/miklevin/drinkme/main/install.bat">Drink Me</a>.

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



