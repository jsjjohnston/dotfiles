{
  pkgs,
  pkgs-unstable,
  nixpkgs,
  ...
}: {
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
  ];

  home.username = "jay";
  home.homeDirectory = "/Users/jay";
  home.sessionPath = [
    "/opt/homebrew/bin"
  ];

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.sessionVariables = {
  };

  home.packages = with pkgs-unstable; [
    prettierd
    _1password-cli
  ];

  programs.home-manager.enable = true;
}
