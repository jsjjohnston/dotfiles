{...}: {
  imports = [
    ../../modules/nixvim
    # ../../modules/git
    # ../../modules/terminals/kitty
    # ../../modules/zoxide
    # ../../modules/fzf
    # ../../modules/shell/bash
    # ../../modules/oh-my-posh
  ];
  home.username = "jay";
  home.homeDirectory = "/home/jay";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
