{ ... }:
{
  flake.nixosModules.minecraft =
    { pkgs, inputs, ... }:
    {
      imports = [
        inputs.nix-minecraft.nixosModules.minecraft-servers
      ];
      nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
      services.minecraft-servers = {
        enable = true;
        eula = true;
        dataDir = "/srv/minecraft-servers";
        servers.luckyblock = {
          enable = true;
          serverProperties = {
            white-list = true;
            server-port = 25565;
          };
          package = pkgs.fabricServers.fabric-1_21_11;
          whitelist = {
            ItzEmoji = "9764484a-7e56-4b31-8bb1-91d0f535292a";
            Sel_X = "34a3195a-88cf-4da3-bd1c-7b71ed4eb4f6";
          };
          operators = {
            ItzEmoji = "9764484a-7e56-4b31-8bb1-91d0f535292a";
            Sel_X = "34a3195a-88cf-4da3-bd1c-7b71ed4eb4f6";
          };
        };
      };
    };
}
