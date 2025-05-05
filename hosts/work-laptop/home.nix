{config, ...}: {
  imports = [
    ../../modules/1password-shell-plugins
    ../../modules/atuin
    ../../modules/fzf
    ../../modules/ghostty
    ../../modules/git
    ../../modules/github
    ../../modules/home-manager
    ../../modules/java
    ../../modules/lazygit
    ../../modules/nvf
    ../../modules/oh-my-posh
    ../../modules/shell/bash
    ../../modules/shell/zsh
    ../../modules/sioyek
    ../../modules/sops
    ../../modules/starship
    ../../modules/tmux
    ../../modules/tmuxinator
    ../../modules/yazi
    ../../modules/zoxide
    ../../modules/linters/ruff.nix
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
}
