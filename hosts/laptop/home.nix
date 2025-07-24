{config, ...}: {
  imports = [
    # ../../modules/sops
    ../../modules/1password-shell-plugins
    ../../modules/atuin
    ../../modules/bat
    ../../modules/btop
    ../../modules/fd
    ../../modules/fzf
    ../../modules/ghostty
    ../../modules/git
    ../../modules/github
    ../../modules/java
    ../../modules/jq
    ../../modules/k9s
    ../../modules/lazygit
    ../../modules/nvf
    ../../modules/oh-my-posh
    ../../modules/shell/bash
    ../../modules/shell/zsh
    ../../modules/sioyek
    ../../modules/starship
    ../../modules/tmux
    ../../modules/window-managers/hyprland.nix
    ../../modules/yazi
    ../../modules/zoxide
  ];

  home = {
    username = "jay";
    homeDirectory = "/home/jay";
    sessionVariables = {
      XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    };
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
