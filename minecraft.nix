{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
  services.minecraft-servers = {
    enable = true;
    eula = true;
    dataDir = "/srv/minecraft-servers";
    servers.oneblock = {
      enable = true;
      serverProperties = {
        white-list = true;
        server-port = 4300;
      };
      package = pkgs.vanillaServers.vanilla-1_21_11;
      whitelist = {
        ItzEmoji = "9764484a-7e56-4b31-8bb1-91d0f535292a";
        Sel_X = "34a3195a-88cf-4da3-bd1c-7b71ed4eb4f6";
        Revandives = "fa6538d1-0046-4ef7-b4af-919b434d956c";
      };
      operators = {
        ItzEmoji = "9764484a-7e56-4b31-8bb1-91d0f535292a";
      }; 
    };
    servers.survival = {
      enable = true;
      serverProperties = {
        white-list = true;
      };
      package = pkgs.fabricServers.fabric-1_21_11;
      whitelist = {
        ItzEmoji = "9764484a-7e56-4b31-8bb1-91d0f535292a";
        Sel_X = "34a3195a-88cf-4da3-bd1c-7b71ed4eb4f6";
        Aleksus401 = "ad541490-a394-4474-83b9-6fee5ae50aef";
      };
      operators = {
        ItzEmoji = "9764484a-7e56-4b31-8bb1-91d0f535292a";
        Sel_X = "34a3195a-88cf-4da3-bd1c-7b71ed4eb4f6";
      };
      symlinks = with pkgs; {
        mods = linkFarmFromDrvs "mods" (builtins.attrValues {
        worldedit = fetchurl { url = "https://cdn.modrinth.com/data/1u6JkXh5/versions/SisHd23s/worldedit-mod-7.3.18.jar"; sha512 = "683ae6bc80fa61c9b6d2af8897e249bb8bf5b0d934e7ea22f9790fd6c4c86f94fc6fa1ed837d8879b676f56ceedaa02a5627509358ff2e966175740060add2a4"; };
        });
      };
    };
  };
}
