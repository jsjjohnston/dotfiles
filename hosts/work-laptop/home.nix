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

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.file =
    {
    };

  programs.java.enable = true;
  home.sessionVariables =
    {
    };

  programs.lazygit = {
    enable = true;
  };
  home.packages = with pkgs; [
    prettierd
    _1password-cli
  ];
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
    ];
  };
  programs.gh.enable = true;
  programs.home-manager.enable = true;
}
