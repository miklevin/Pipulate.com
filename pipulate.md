---
title: Pipulate
description: Free and Open Source SEO Software
permalink: /
group: home
---

# {{ page.description }}

### Pipulate Is a Full Linux Server

But don't fear! You can run a full Linux server on your Windows desktop like
never before. Microsoft has made it easy with their Windows Subsystem for
Linux, and it's worth it for all the new capabilities you'll have. If you've
ever felt imposter syndrome, fix it here and now. Become a Python SEO capable
of going the distance.

#### Don't Get Stuck in "Lost Mode"

The ultimate tool for SEO is Python, and the easiest way to get started with
Python is Jupyter. The problem becomes going from Jupyter to 24x7 automation.
You too easily get locked into ***"Lost Mode"*** where you have to sit there
and press a button. 

The main purpose of Pipulate is to get you over the ***Lost*** mode hurdle.
25x7 Linux daemons are a text-file away if you only know how to:

    sudo vim /etc/systemd/system/awesome.service

This site solves this classic problem by closing the gap between desktop
Jupyter Notebooks and headless Linux servers. Do it on your Windows desktop
just like you would on a real server, so moving it over is easy.

## Installing Pipulate

Pipulate is a Linux server that runs in the background under Windows Subsystem
for Linux (WSL) through JupyterLab and Linux systemd services. Once Pipulate is
installed, you will have access to JupyterLab on your local machine at <a
href="http://localhost:8080">localhost:8080</a> with a number of pre-installed
Python packages for such tasks as:

- Crawling websites
- Scraping search results
- Automating Web browsers
- Pulling data from Google Analytics 
- Pulling data from Google Search Console
- Emailing yourself screenshots and reports

Each of these Notebooks can be run on-demand and interactively through
JupyterLab, but also can be turned into a scheduled automated task running in
the background of your computer exactly as it would on a server. Before long
you'll be able to deploy Pipulate servers at home, on cloud, or just keep it on
your laptop. The point is you'll know ***how*** this stuff works without
becoming beholden to yet another $30 to $300 per month proprietary product.

To install Pipulate, <a href="https://raw.githubusercontent.com/miklevin/drinkme/main/install.bat">Drink Me</a>.

### Local Jupyter vs. Google Colab, Azure Notebooks, Binder, etc.

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

