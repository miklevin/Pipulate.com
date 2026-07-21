---
title: Documentation
permalink: /guide/
description: Start here for Pipulate documentation, guides, and resources
group: documentation
---

# Pipulate Documentation

Welcome to the official documentation hub for Pipulate, the free and open source AI-readiness workflow platform for the agentic web. This page is your starting point for understanding, installing, and building with Pipulate.

## What is Pipulate?

Pipulate is a local-first, step-based workflow system for agentic-web readiness and data automation — the craft that grew out of SEO. It lets you turn Python scripts and Jupyter notebooks into user-friendly, web-based workflows—no cloud, no vendor lock-in, and no complex setup.

## Quick Links

- **[Installation Guide](/)**  
  Step-by-step instructions for installing Pipulate on macOS, Linux, or Windows (WSL). *(The homepage doubles as the install guide.)*

- **[Architecture Overview](/architecture/)**  
  Learn how Pipulate is built, its core design principles, and how the workflow engine works.

- **[1-Page Development Guide](/development/)**  
  Single-source page for patterns, best practices, and how to create your own workflows and plugins.

- **[In-depth Guide](/guide/)**  
  Broken-out detailed developer guide stepping through all aspects of the project to build up the understanding.

- **[Philosophy](/philosophy/)**  
  Deep dive into the principles and design decisions that shape Pipulate.

## Where to Start

- **New to Pipulate?**
  - Begin with the [Installation Guide](/) to get Pipulate running on your system.
  - Read the [Architecture Overview](/architecture/) for a high-level understanding.

## Architecture

The Architecture section provides a deep dive into how Pipulate is built and how it works:

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

- **Core Components**
  - Workflow Engine
  - Local-First Architecture
  - Plugin System
  - Data Management

- **Design Principles**
  - Local-First Philosophy
  - Open Source Approach
  - Extensibility
  - Security Model

For detailed information, visit the [Architecture Overview](/architecture/).

## Development

The Development section covers everything you need to know about building with Pipulate:

- **Creating Workflows**
  - Workflow Structure
  - Step Types
  - Data Flow
  - Error Handling

- **Plugin Development**
  - Plugin Architecture
  - Creating Custom Steps
  - Integration Patterns
  - Testing

- **Best Practices**
  - Code Organization
  - Performance Optimization
  - Security Considerations
  - Documentation Standards

For detailed information, visit the [Development Guide](/development/).

## Repository Resources

- **[Main Repository](https://github.com/miklevin/pipulate)**  
  The core Pipulate codebase and documentation.

- **[Development Rules](https://github.com/miklevin/pipulate/tree/main/.cursor/rules)**  
  Guidelines and patterns for contributing to Pipulate.

- **[README](https://github.com/miklevin/pipulate/blob/main/README.md)**  
  Project overview and quick start information.

## About This Documentation

- **Install instructions** are always up to date on the [homepage](/).
- **Architecture and development docs** are maintained for both new and advanced users.
- **Workflow patterns and plugin examples** are available in the guides and the main [pipulate](https://github.com/miklevin/pipulate) repository.

If you can't find what you need, please open an issue on [GitHub](https://github.com/miklevin/pipulate) or check the guide for the latest updates.

---

*Pipulate: Your data, your workflows, your way—locally and openly.* 
