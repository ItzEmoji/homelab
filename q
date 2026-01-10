{ modulesPath, lib, pkgs, ... } @args:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
    ./minecraft.nix
  ];
  nixpkgs.config.allowUnfree = true;
  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;
  services.tailscale.enable = true;
  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [
    fastfetch
    neovim
    tmux
    vim
    docker-compose
    curl
    cacert
    maven
    git
    temurin-bin-21
    k9s
    dive
    gitMinimal
    wget
  ];
  networking.firewall.enable = false;
  users.users.root.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKQ6mkR7siw01qo8FPru7N5AyP9qkr3B1VtiERugolDz" ];
  system.stateVersion = "24.05";
}
