{ ... }:
{
  services.minecraft-server = {
    enable = true;
    eula = true;
    declarative = true;
    serverProperties = {
      keepInventory = true;
    };
  };
}
