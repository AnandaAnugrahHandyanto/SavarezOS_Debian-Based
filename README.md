# 🚀 SavarezOS GNU/Linux

**SavarezOS** is a customized, high-performance Linux distribution based on **Debian 12 (Bookworm)**. Designed with a focus on a personalized computing experience, it features the **KDE Plasma** desktop environment for a modern and flexible workflow.

---

## ✨ Key Features
* **Base System:** Built on the rock-solid stability of Debian Bookworm.
* **Desktop Environment:** Powered by KDE Plasma for a beautiful and customizable UI.
* **Custom Branding:** Unique SavarezOS identity, including custom wallpapers, logos, and a dedicated Calamares installer.
* **Optimized for Developers:** Pre-configured environment ready for IT students and developers.
* **Fast Installation:** Seamless setup experience using the integrated Calamares live installer.

## 🖥️ System Specifications
| Component | Details |
| :--- | :--- |
| **OS Name** | SavarezOS GNU/Linux |
| **Architecture** | amd64 (x86_64) |
| **Base Distro** | Debian 12 (Bookworm) |
| **Kernel** | Debian Stable Kernel |
| **Init System** | systemd |
| **Desktop** | KDE Plasma |

---

## 📥 Installation Guide

### 1. Download the ISO
Go to the [Releases](https://github.com/AnandaAnugrahHandyanto/SavarezOS_Debian-Based/releases) page and download the latest build. 

> **Note:** Due to GitHub's file size limits, the ISO is provided in a split-zip format (`.zip`, `.z01`, etc.).

### 2. Extract the ISO
To reconstruct the ISO file on Linux/CachyOS:
```bash
sudo pacman -S p7zip
7z x SavarezOS-Alpha-vXX.zip
```

### 3. Flash to USB
Use a tool like Ventoy, BalenaEtcher, or dd to create a bootable USB drive.

### 4. Install
Boot from the USB and click the "Install SavarezOS" icon on the desktop. Follow the Calamares installer steps.

### 🛠️ Build Information
This project is built automatically using GitHub Actions.

* Build Tool: live-build
* Configuration: Custom SavarezOS hooks and branding configurations.

### 🤝 Support & Contribution
This project is currently in the Alpha stage as part of a University Final Project (UAS). Feel free to open an issue if you encounter any bugs!

Developed with ❤️ by Ananda Anugrah Handyanto