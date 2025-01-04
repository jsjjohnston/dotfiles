{ pkgs, ... }:
{
  imports = [
    ../../modules/nixvim
    ../../modules/git
    ../../modules/terminals/kitty
    ../../modules/zoxide
    ../../modules/fzf
    ../../modules/oh-my-posh
    ../../modules/shell/bash
  ];

  home.username = "jay";
  home.homeDirectory = "/Users/jay";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.file = {
  };

  programs.java.enable = true;

  home.sessionVariables = {
  };

  programs.lazygit = {
    enable = true;
  };

  home.packages = with pkgs; [
    prettierd
    _1password-cli
  ];

  # programs.ghostty.enable = true;
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-Space";
    terminal = "screen-256color";
    sensibleOnTop = true;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
    ];
  };

  catppuccin = {
    flavor = "mocha";
    enable = true;
  };

  programs.gh.enable = true;

  programs.zsh.enable = true;

  programs.home-manager.enable = true;
}
