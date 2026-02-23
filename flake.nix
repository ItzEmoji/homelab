{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    nixos-dotfiles.url = "github:ItzEmoji/nixos-dotfiles";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
  # outputs = { nixpkgs, disko, ...}@inputs:
  #   {
  #     nixosConfigurations.server = nixpkgs.lib.nixosSystem {
  #       system = "x86_64-linux";
  #       specialArgs = { inherit inputs; };
  #       modules = [
  #         disko.nixosModules.disko
  #         inputs.nix-minecraft.nixosModules.minecraft-servers
  #         ./configuration.nix
  #         ./hardware-configuration.nix
  #       ];
  #     };
  #   };
}
