{config, ...}: {
  imports = [
    ../../modules/fzf
    ../../modules/ghostty
    ../../modules/git
    ../../modules/java
    ../../modules/lazygit
    ../../modules/nvf
    ../../modules/shell/bash
    ../../modules/shell/zsh
    ../../modules/tmux
    ../../modules/zoxide
    ../../modules/starship
    ../../modules/yazi
    ../../modules/tmuxinator
  ];

  home = {
    username = "jay";
    homeDirectory = "/home/jay";
    sessionPath = [
    ];
    sessionVariables = {
    };
    shellAliases = {
      build = "sudo nixos-rebuild switch --flake ~/dotfiles/hosts/server#server";
      update = "nix flake update --flake ~/dotfiles/hosts/server/";
      cat = "bat";
    };
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
