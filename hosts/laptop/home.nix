{pkgs, ...}: {
  imports = [
    ../../modules/nixvim
    ../../modules/window-managers/hyprland.nix
    ../../modules/terminals/kitty
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

  programs.git = {
    enable = true;
    userName = "Jay Johnston";
    userEmail = "jsjjohnston@gmail.com";
    lfs.enable = true;
    extraConfig = {
      push = {autoSetupRemote = true;};
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
