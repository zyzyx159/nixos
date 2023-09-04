{ config, pkgs, lib, ... }:

{
  home.username = "zyzyx";
  home.homeDirectory = "/home/zyzyx";
  home.sessionPath = [ "~/.local/bin" ];

  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    cargo
    git
    gnumake
    neovim
    nitrogen
    nodejs_20
    python311
    python311Packages.pip
    starship
    tmux
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -al";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "marlonrichert/zsh-autocomplete"; }
      ];
    };
  };

  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML "/home/zyzyx/git/dotFiles/starship/starship.toml";
  };

  programs.git = {
    enable = true;
    userName = "Daniel Stellmon";
    userEmail = "DStellm@gmail.com";
  };

  programs.tmux = {
    enable = true;
  };
  
  home.file = {
  };

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
