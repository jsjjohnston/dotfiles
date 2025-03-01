{pkgs-unstable, ...}: {
  imports = [
    ../../modules/fzf
    ../../modules/ghostty
    ../../modules/git
    ../../modules/github
    ../../modules/java
    ../../modules/lazygit
    ../../modules/nixvim
    ../../modules/nvf
    ../../modules/oh-my-posh
    ../../modules/shell/bash
    ../../modules/shell/zsh
    ../../modules/tmux
    ../../modules/zoxide
    ../../modules/starship
    ../../modules/yazi
    ../../services/podman
  ];
  home = {
    username = "jay";
    homeDirectory = "/Users/jay";
    sessionPath = [
      "/opt/homebrew/bin"
    ];

    stateVersion = "24.11"; # Please read the comment before changing.
  };

  programs.home-manager.enable = true;
}
