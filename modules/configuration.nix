{ inputs, self, ... }:
{
  flake.nixosConfigurations.cyril-nixos = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs self; };
    modules = [
      ./_hardware_configuration.nix
      "${inputs.nixpkgs}/nixos/modules/installer/scan/not-detected.nix"
      "${inputs.nixpkgs}/nixos/modules/profiles/qemu-guest.nix"
      self.nixosModules.nix-config
      self.nixosModules.grub
      self.nixosModules.minecraft
      inputs.nixos-dotfiles.nixosModules.tailscale
      inputs.nixos-dotfiles.nixosModules.ssh-server
      self.nixosModules.packages
      {

        networking.hostName = "server";
        virtualisation.docker.enable = true;
        networking.firewall.enable = false;
        users.users.root.openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKQ6mkR7siw01qo8FPru7N5AyP9qkr3B1VtiERugolDz"
        ];
        system.stateVersion = "24.05";
      }
    ];
  };
}
