{
  pkgs,
  inputs,
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
    ../../modules/app-launchers/rofi.nix
    ../../modules/browsers/firefox.nix
    ../../modules/status-bars/waybar.nix
    ../../modules/terminals/kitty
  ];
  home.username = "jay";
  home.homeDirectory = "/home/jay";

  home.stateVersion = "24.11";
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

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-Space";
    terminal = "screen-256color";
    # shell = "/etc/profiles/per-user/jay/bin/bash";
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";
    historyLimit = 50000;
    aggressiveResize = true;
    focusEvents = true;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
    ];
  };

  dconf.enable = false;
  stylix = {
    enable = true;
    image = ./../../images/background.jpg;
    polarity = "dark";
  };

  home.packages = [ inputs.hyprland-qtutils.packages.x86_64-linux.default ];
  # catppuccin = {
  #   flavor = "mocha";
  #   accent = "blue";
  #   enable = true;
  # };
  #
  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
