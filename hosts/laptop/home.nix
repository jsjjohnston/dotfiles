{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
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
    ../../modules/ghostty
    ../../modules/nvf
    ../../modules/tmux
  ];
  home = {
    username = "jay";
    homeDirectory = "/home/jay";

    stateVersion = "24.11";

    file = {
    };

    sessionVariables = {
      EDITOR = "nvim";
      NIXOS_OZONE_WL = "1";
    };
  };
  programs = {
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
