{
  pkgs,
  pkgs-unstable,
  nixpkgs,
  ...
}:
{
  imports = [
    # ../../modules/nixvim
    ../../modules/git
    # ../../modules/terminals/kitty
    ../../modules/zoxide
    ../../modules/fzf
    ../../modules/oh-my-posh
    ../../modules/shell/bash
    ../../modules/tmux
    ../../modules/nvf
  ];

  home.username = "jay";
  home.homeDirectory = "/Users/jay";
  home.sessionPath = [
    "/opt/homebrew/bin"
  ];

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.file = {
    "cyberdream.tmuxtheme" = {
      source = ../../modules/tmux/themes/catppuccin_cyberdream.tmuxtheme;
      target = "/Users/jay/.tmux/plugins/tmux/themes/catppuccin_cyberdream.tmuxtheme";
    };
  };

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
  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
      hosts = [
        "https://github.com"
        "https://gist.github.com"
      ];
    };
    settings = {
      git_protocol = "ssh";

      prompt = "enabled";
      editor = "nvim";

    };
  };

  programs.zsh.enable = false;

  programs.home-manager.enable = true;
}
