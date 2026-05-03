{ ... }:
{
  flake.nixosModules.git =
    { pkgs, ... }:
    {
      users.users.git = {
        group = "git";
        extraGroups = [ "docker" ];
        createHome = true;
        isSystemUser = true;
        shell = pkgs.bash;
      };
      users.groups.git = {};
      services.openssh = {
        extraConfig = ''
          Match User git
              AuthorizedKeysCommand /opt/gitlab/gitlab-key-check %u %k
              AuthorizedKeysCommandUser root
        '';
      };
    };
}
