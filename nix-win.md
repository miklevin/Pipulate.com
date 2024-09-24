---
title: Nix on Windows
description: Step-by-step guide to installing Nix on Windows using Determinate Systems' installer and WSL. Simplify collaboration with reproducible environments using Nix flakes.
permalink: /nix-win/
group: nix-win
---

# Installing Nix on Windows

Nix provides a reproducible and declarative package management system, ensuring that you and your co-developers are using the exact same dependencies and configurations. This eliminates the classic "it works on my machine" problem, streamlining collaboration and reducing setup time. On Windows, Nix can be installed using the Windows Subsystem for Linux (WSL), which allows you to run a Linux environment directly on Windows. By following these instructions, your team can quickly align their development environments, allowing you to focus on writing and running code seamlessly across all machines.

---

### **Prerequisites: Install WSL and a Linux Distribution**

Before installing Nix, you need to enable WSL and install a Linux distribution like Ubuntu.

#### **Step 1: Enable WSL**

1. **Open PowerShell as Administrator:**
   - Click on the **Start** menu.
   - Type `PowerShell`.
   - Right-click on **Windows PowerShell** and select **Run as administrator**.

2. **Enable WSL and Install Ubuntu:**
   - In the PowerShell window, run the following command:

     ```powershell
     wsl --install -d Ubuntu
     ```

     This command will enable WSL, install the latest WSL kernel, and set up Ubuntu as your Linux distribution.

3. **Restart Your Computer:**
   - After the installation, you may be prompted to restart your computer. Type `Y` and press `Enter`, or manually restart.

---

#### **Step 2: Set Up Ubuntu**

1. **Launch Ubuntu:**
   - After restarting, open the **Start** menu.
   - Search for **Ubuntu** and launch it.

2. **Complete Initial Setup:**
   - Ubuntu will initialize and prompt you to create a new UNIX username and password. This will be your Linux user account within WSL.

---

### **Installing Nix Using Determinate Systems' Installer**

#### **Step 3: Update Package Lists**

In the Ubuntu terminal, update the package lists:

```bash
sudo apt update
sudo apt upgrade
```

#### **Step 4: Install Required Dependencies**

Install `curl` if it's not already installed (it was already installed on Ubuntu
24.04 last time I checked):

```bash
sudo apt install curl -y
```

#### **Step 5: Run the Nix Installer**

Run the Determinate Systems' Nix installer:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate
```

#### **Step 6: Follow the Installation Prompts**

- **Grant Permissions:**
  - You may be prompted to enter your Linux user password. Type it in and press `Enter`. Note that the password input will be invisible for security reasons.

- **Installation Process:**
  - The installer will download and set up Nix in your WSL environment. Follow any on-screen instructions if prompted.

---

### **Step 7: Restart Your Terminal Session**

To apply the changes made by the installer, you need to restart your terminal or source your shell profile:

- **Close and Reopen Ubuntu:**
  - Exit the terminal by typing `exit` and pressing `Enter`.
  - Reopen Ubuntu from the Start menu.

- **Or, Source Your Shell Configuration:**
  - For **Bash** (default shell in Ubuntu):

    ```bash
    source ~/.bashrc
    ```

  - For **Zsh** (if you're using Zsh):

    ```bash
    source ~/.zshrc
    ```

---

### **Step 8: Verify the Installation**

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

- **Using Nix in WSL:**
  - Remember that Nix is installed within your WSL Linux environment. Commands need to be run in the Ubuntu terminal, not the Windows Command Prompt or PowerShell.

- **Accessing Windows Files:**
  - Your Windows files are accessible within WSL under `/mnt/c/`.

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

