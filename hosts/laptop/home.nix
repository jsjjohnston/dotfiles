{
  # pkgs,
  # inputs,
  ...
}:
{
  imports = [
    ../../modules/nixvim
    ../../modules/window-managers/hyprland.nix
    ../../modules/terminals/kitty
    ../../modules/git
    ../../modules/zoxide
    ../../modules/fzf
    ../../modules/shell/bash
    ../../modules/oh-my-posh
    # ../../modules/app-launchers/anyrun.nix
    ../../modules/dconf
    # ../../modules/app-launchers/rofi.nix
    ../../modules/app-launchers/anyrun.nix
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

  home.file =
    {
    };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
