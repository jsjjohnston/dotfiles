{config, ...}: {
  imports = [
    ../../modules/1password-shell-plugins
    ../../modules/aerospace
    ../../modules/atuin
    ../../modules/bat
    ../../modules/browsers/qutebrowser
    ../../modules/btop
    ../../modules/fd
    ../../modules/fzf
    ../../modules/ghostty
    ../../modules/git
    ../../modules/github
    ../../modules/home-manager
    ../../modules/java
    ../../modules/jq
    ../../modules/k9s
    ../../modules/lazydocker
    ../../modules/lazygit
    ../../modules/linters/ruff.nix
    ../../modules/nvf
    ../../modules/oh-my-posh
    ../../modules/sesh
    ../../modules/shell/bash
    ../../modules/shell/zsh
    ../../modules/sioyek
    ../../modules/sketchybar
    ../../modules/sops
    ../../modules/starship
    ../../modules/tmux
    ../../modules/tmuxinator
    ../../modules/yazi
    ../../modules/zoxide
    ../../services/restic
  ];

  home = {
    username = "jay";
    homeDirectory = "/Users/jay";
    sessionPath = [
      "/opt/homebrew/bin"
    ];
    sessionVariables = {
      XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    };
    # Please read the comment before changing.
    stateVersion = "24.11";
  };
  programs = {
    broot.enable = true;
    fastfetch.enable = true;
    halloy.enable = true;
  };
  services = {
    home-manager = {
      autoExpire = {
        enable = true;
        store.cleanup = true;
        store.options = "--delete-older-than 30d";
      };
      autoUpgrade.frequency = "weekly";
    };
  };
}
