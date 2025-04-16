{
  config,
  pkgs,
  ...
}: {
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
    ../../modules/tmuxinator
    ../../modules/sioyek
    ../../modules/sops
    ../../modules/atuin
    ../../modules/1password-shell-plugins
  ];

  programs = {
    home-manager.enable = true;
  };

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
