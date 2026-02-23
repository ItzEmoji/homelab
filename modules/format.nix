{ inputs, ... }:
{
  config.systems = [
    "x86_64-linux"
  ];
  imports = [
    inputs.treefmt-nix.flakeModule
  ];
  config.perSystem =
    { ... }:
    {
      treefmt.config = {
        projectRootFile = "flake.nix";
        programs.nixfmt.enable = true;
      };
    };

}
