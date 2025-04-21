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
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "text/html" = "w3m";
  };
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

  programs = {
    atuin = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        auto_sync = true;
        sync_frequency = "15s";
        sync_address = "http://127.0.0.1:8888";
        search_mode = "prefix";
      };
    };
    home-manager.enable = true;
  };
}
