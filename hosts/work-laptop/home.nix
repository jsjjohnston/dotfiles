{ ... }:
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

  home.packages =
    [
    ];

  home.file =
    {
    };

  home.sessionVariables =
    {
    };

  programs.lazygit = {
    enable = true;
  };
  programs.gh.enable = true;
  programs.home-manager.enable = true;
}
