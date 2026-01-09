[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)
# NixOS-Homelab
A declaritive managed Homelab using pure Nix.

## 🚀 Features

The crown jewel of this setup is the game server infrastructure. Rather than manually managing JAR files and server.properties, the entire Minecraft stack is managed declaratively using nix-minecraft.

Capabilities:

- Version Pinning: The exact server version is locked in flake.lock.

- Mod Management: Mods are fetched and hashed by Nix, ensuring all players and the server share the exact binary files.

- Service Hardening: Runs in a dedicated systemd slice with restricted permissions.

## 📂 Repository Structure
```bash
.
├── flake.nix                   # The entry point and dependency definitions
├── flake.lock                  # Exact version hashes for reproducibility
├── configuration.nix           # Configures the System
├── disk-config.nix             # Defines the partitions using disko
├── minecraft.nix               # The configuration of the Minecraft Servers
├── hardware-configuration.nix  # Defines the hardware configuration


```
