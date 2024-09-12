---
title: Nix on macOS
description: Step-by-step guide to installing Nix on macOS using Determinate Systems' installer. Simplify collaboration with reproducible environments using Nix flakes.
permalink: /nix-mac/
group: nix-mac
---

# Installing Nix on macOS

Nix provides a reproducible and declarative package management system, ensuring
that you and your co-developers are using the exact same dependencies and
configurations. This eliminates the classic "it works on my machine" problem,
streamlining collaboration and reducing setup time. The Determinate Systems'
installer simplifies the installation process, making it easy even for those new
to Nix. By following these instructions, your team can quickly align their
development environments, allowing you to focus on writing and running code
seamlessly across all machines.

---

### **Step 1: Open Terminal**

- **Via Spotlight Search:**
  - Press `Command (⌘) + Space` to open Spotlight Search.
  - Type `Terminal` and press `Enter`.

- **Via Finder:**
  - Navigate to `Applications` > `Utilities`.
  - Double-click on `Terminal`.

---

### **Step 2: Run the Installer Command**

In the Terminal window, paste the following command and press `Enter`:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate
```

---

### **Step 3: Follow the Installation Prompts**

- **Grant Permissions:**
  - You may be prompted to enter your administrator password. Type it in and press `Enter`. Note that the password input will be invisible for security reasons.

- **Installation Process:**
  - The installer will download and set up Nix on your system. Follow any on-screen instructions if prompted.

---

### **Step 4: Restart Your Terminal Session**

To apply the changes made by the installer, you need to restart your Terminal or source your shell profile:

- **Close and Reopen Terminal:**
  - Simply close the Terminal window and open a new one.

- **Or, Source Your Shell Configuration:**
  - For **Zsh** (default shell in macOS Catalina and later):

    ```bash
    source ~/.zshrc
    ```

  - For **Bash**:

    ```bash
    source ~/.bashrc
    ```

---

### **Step 5: Verify the Installation**

Ensure that Nix is installed correctly by checking its version:

```bash
nix --version
```

You should see output similar to:

```
nix (Nix) 2.x.x
```

---

### **Additional Notes**

- **Updating Nix:**
  - To update Nix in the future, you can use:

    ```bash
    nix upgrade-nix
    ```

- **Uninstalling Nix:**
  - If you need to uninstall Nix, run:

    ```bash
    /nix/nix-installer uninstall
    ```

- **Documentation and Help:**
  - Visit the [Nix documentation](https://nixos.org/manual/nix/stable/) for more information.
  - For help, you can use:

    ```bash
    nix --help
    ```


