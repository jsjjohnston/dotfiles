{config, ...}: {
  imports = [
    ../../modules/fzf
    ../../modules/ghostty
    ../../modules/git
    ../../modules/github
    ../../modules/java
    ../../modules/lazygit
    ../../modules/nvf
    ../../modules/oh-my-posh
    ../../modules/shell/bash
    ../../modules/shell/zsh
    ../../modules/tmux
    ../../modules/zoxide
    ../../modules/starship
    ../../modules/yazi
    ../../modules/window-managers/hyprland.nix
    ../../modules/sioyek
    # ../../modules/sops
    ../../modules/atuin
    ../../modules/1password-shell-plugins
  ];

  home = {
    username = "jay";
    homeDirectory = "/home/jay";
    sessionVariables = {
      XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    };
    # Please read the comment before changing.
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
