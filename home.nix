{ config, pkgs, ... }:

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
  
  programs.neovim = {
    enable = true;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
#    "/home/zyzyx/.config/tmux/tmux.conf".source = /home/zyzyx/git/dotFiles/tmux/tmux.conf;
#    "/home/zyzyx/.zshrc".source = /home/zyzyx/git/dotFiles/zsh/.zshrc;
#    "/home/zyzyx/.config/lvim/config.lua".source = /home/zyzyx/git/dotFiles/lvim/config.lua;
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/zyzyx/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
