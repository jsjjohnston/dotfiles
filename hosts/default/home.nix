{pkgs, ...}: {
  imports = [
    ../../modules/nixvim
    ../../modules/git
    ../../modules/terminals/kitty
  ];
  home.username = "jay";
  home.homeDirectory = "/home/jay";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    alejandra
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
