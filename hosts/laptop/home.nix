{pkgs, ...}: {
  imports = [
    ../../modules/nixvim
    ../../modules/window-managers/hyprland.nix
    ../../modules/terminals/kitty
    ../../modules/git
  ];
  home.username = "jay";
  home.homeDirectory = "/home/jay";

  home.stateVersion = "24.05";

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

  home.packages = with pkgs; [
    zig
    gitAndTools.gh
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
