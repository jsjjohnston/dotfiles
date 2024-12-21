{
  # pkgs,
  # inputs,
  ...
}:
{
  imports = [
    ../../modules/nixvim
    ../../modules/window-managers/hyprland.nix
    ../../modules/git
    ../../modules/zoxide
    ../../modules/fzf
    ../../modules/shell/bash
    ../../modules/oh-my-posh
    ../../modules/dconf
  ];
  home.username = "jay";
  home.homeDirectory = "/home/jay";

  home.stateVersion = "25.05";
  programs.git.userEmail = "jsjjohnston@gmail.com";
  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
      hosts = [
        "https://github.com"
        "https://gist.github.com"
      ];
    };
  };

  # programs.rofi.enable = true;
  # programs.git.enable = true;
  # programs.kitty.enable = true;
  # programs.firefox.enable = true;
  #
  # programs.waybar.enable = true;

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
