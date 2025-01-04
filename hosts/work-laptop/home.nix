{ pkgs, ... }:
{
  imports = [
    ../../modules/nixvim
    ../../modules/git
    ../../modules/terminals/kitty
    ../../modules/zoxide
    ../../modules/fzf
    ../../modules/oh-my-posh
    ../../modules/shell/bash
  ];

  home.username = "jay";
  home.homeDirectory = "/Users/jay";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.file =
    {
    };

  programs.java.enable = true;

  home.sessionVariables =
    {
    };

  programs.lazygit = {
    enable = true;
  };

  home.packages = with pkgs; [
    prettierd
    _1password-cli
  ];

  # programs.ghostty.enable = true;
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    customPaneNavigationAndResize = true;
    keyMode = "vi";
    mouse = true;
    prefix = "C-Space";
    shell = "${pkgs.bash}/bin/bash";
    extraConfig = ''
      unbind C-Space
      set -g prefix C-Space
      bind C-Space send-prefix
      set -g base-index 1
    '';
    # terminal = "screen-256color";
    sensibleOnTop = true;
    # catppuccin = {
    #   enable = true;
    #   extraConfig = ''
    #     set -g @catppuccin_flavour 'macchiato' # or latte, frappe, macchiato, mocha
    #     set -g @catppuccin_window_right_separator ""
    #     # set -g @catppuccin_window_right_separator "█"
    #     set -g @catppuccin_window_left_separator ""
    #     # set -g @catppuccin_window_left_separator ""
    #     set -g @catppuccin_window_number_position "left"
    #     set -g @catppuccin_window_middle_separator " "
    #     set -g @catppuccin_window_default_text "#W"
    #     set -g @catppuccin_window_default_fill "none"
    #     set -g @catppuccin_window_current_fill "all"
    #     set -g @catppuccin_window_current_text "#W"
    #     set -g @catppuccin_status_modules_right "user host session"
    #     set -g @catppuccin_status_left_separator  " "
    #     # set -g @catppuccin_status_left_separator "█"
    #     set -g @catppuccin_status_right_separator ""
    #     # set -g @catppuccin_status_right_separator "█"
    #     set -g @catppuccin_status_right_separator_inverse "no"
    #     set -g @catppuccin_status_fill "all"
    #     set -g @catppuccin_status_connect_separator "no"
    #     set -g @catppuccin_directory_text "#{pane_current_path}"
    #   '';
    # };
    plugins = with pkgs; [

      tmuxPlugins.vim-tmux-navigator
    ];
  };

  programs.gh.enable = true;

  programs.zsh.enable = true;

  programs.home-manager.enable = true;
}
