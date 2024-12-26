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
  # programs._1password-shell-plugins = {
  #   enable = false;
  #   plugins = with pkgs; [
  #     gh
  #     awscli
  #   ];
  # };

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
    # yarn
    # nodePackages.cdktf-cli
    # nodejs_18
    # typescript
    # typescript-language-server
    # vscode-langservers-extracted
  ];
  programs.gh.enable = true;
  programs.home-manager.enable = true;
}
