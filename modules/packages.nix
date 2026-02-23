{ ... }:

{
  flake.nixosModules.packages =
    { pkgs, ... }:
    {

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
    };
}
