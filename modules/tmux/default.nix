{ pkgs, ... }:
{
  home.file = {
    "cyberdream.tmuxtheme" = {
      source = ../../modules/tmux/themes/catppuccin_cyberdream.tmuxtheme;
      target = "/Users/jay/.tmux/plugins/tmux/themes/catppuccin_cyberdream.tmuxtheme";
    };
  };
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-Space";
    terminal = "screen-256color";
    baseIndex = 1;
    sensibleOnTop = false;
    escapeTime = 0;
    keyMode = "vi";
    historyLimit = 50000;
    aggressiveResize = true;
    focusEvents = true;
    plugins = with pkgs; [
      # TODO: Try this config to see if it fix's pause issues
      # {
      #   plugin = tmuxPlugins.vim-tmux-navigator;
      #   extraConfig = ''
      #     is_vim="ps -o tty= -o state= -o comm= | grep -iqE '^#{s|/dev/||:pane_tty} +[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
      #   '';
      # }
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
