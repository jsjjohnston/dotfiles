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
  ];
  home = {
    username = "jay";
    homeDirectory = "/Users/jay";
    sessionPath = [
      "/opt/homebrew/bin"
    ];

    # Please read the comment before changing.
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
