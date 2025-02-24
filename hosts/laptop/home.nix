{
  pkgs,
  inputs,
  ...
}: {
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
  home = {
    username = "jay";
    homeDirectory = "/home/jay";

    stateVersion = "24.11";

    packages = [inputs.hyprland-qtutils.packages.x86_64-linux.default];
    file = {
    };

    sessionVariables = {
      EDITOR = "nvim";
    };
  };
  programs = {
    git.userEmail = "jsjjohnston@gmail.com";
    gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
        hosts = [
          "https://github.com"
          "https://gist.github.com"
        ];
      };
    };
    tmux = {
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

    home-manager.enable = true;
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  dconf.enable = false;
  stylix = {
    enable = true;
    image = ./../../images/background.jpg;
    polarity = "dark";
  };
}
