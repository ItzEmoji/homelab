{ ... }:
{
  flake.nixosModules.grub =
    { ... }:
    {

      boot.loader.grub = {
        efiSupport = true;
        efiInstallAsRemovable = true;
      };
    };
}
