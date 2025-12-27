{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
  services.minecraft-server = {
    enable = true;
    eula = true;
    declarative = true;
    package = pkgs.vanillaServers.vanilla-1_21_11;
    dataDir = "/srv/minecraft-server/survival-1.21.10";
    serverProperties = {
      white-list = true;
    };
    whitelist = 
    {
        ItzEmoji = "9764484a-7e56-4b31-8bb1-91d0f535292a";
        Sel_X = "34a3195a-88cf-4da3-bd1c-7b71ed4eb4f6";
        Aleksus401 = "ad541490-a394-4474-83b9-6fee5ae50aef";
    };
  };
}
