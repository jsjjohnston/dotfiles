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

  home.sessionVariables =
    {
    };

  programs.lazygit = {
    enable = true;
  };
  home.packages = with pkgs; [
    prettierd
  ];
  programs.gh.enable = true;
  programs.home-manager.enable = true;
}
