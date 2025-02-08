{
  pkgs,
  pkgs-unstable,
  nixpkgs,
  ...
}:
{
  imports = [
    ../../modules/fzf
    ../../modules/ghostty
    ../../modules/git
    ../../modules/github
    ../../modules/nixvim
    ../../modules/nvf
    ../../modules/oh-my-posh
    ../../modules/shell/bash
    ../../modules/tmux
    ../../modules/zoxide
  ];

  home.username = "jay";
  home.homeDirectory = "/Users/jay";
  home.sessionPath = [
    "/opt/homebrew/bin"
  ];

  home.stateVersion = "24.11"; # Please read the comment before changing.

  programs.java.enable = true;

  home.sessionVariables = {
  };

  home.packages = with pkgs-unstable; [
    prettierd
    _1password-cli
  ];

  programs.lazygit = {
    # TODO: finish theme config https://github.com/scottmckendry/cyberdream.nvim/blob/main/extras/lazygit/cyberdream.yml
    enable = true;
    settings = {
      gui.theme = { };
    };
  };

  programs.zsh.enable = false;

  programs.home-manager.enable = true;
}
