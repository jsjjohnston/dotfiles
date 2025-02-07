{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-Space";
    terminal = "screen-256color";
    # shell = "/etc/profiles/per-user/jay/bin/bash";
    # shell = pkgs.bashInteractive;
    baseIndex = 1;
    sensibleOnTop = false;
    escapeTime = 0;
    keyMode = "vi";
    historyLimit = 50000;
    aggressiveResize = true;
    focusEvents = true;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          source-file "/Users/jay/.tmux/plugins/tmux/themes/catppuccin_cyberdream.tmuxtheme"
          set -g @catppuccin_flavour "cyberdream"
        '';
      }
    ];
  };
}
