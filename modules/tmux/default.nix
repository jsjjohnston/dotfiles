{
  pkgs,
  config,
  ...
}: {
  home.file = {
    "cyberdream.tmuxtheme" = {
      source = ../../modules/tmux/themes/catppuccin_cyberdream.tmuxtheme;
      target = "${config.home.homeDirectory}/.tmux/plugins/tmux/themes/catppuccin_cyberdream.tmuxtheme";
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
    newSession = true;
    tmuxinator.enable = true;
    extraConfig = ''
      set-window-option -g visual-bell on
      set-window-option -g bell-action other
      bind c new-window -c "#{pane_current_path}"
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      set-option -g allow-rename off
      set -g detach-on-destroy off
      bind-key x kill-pane
    '';
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          source-file "${config.home.homeDirectory}/.tmux/plugins/tmux/themes/catppuccin_cyberdream.tmuxtheme"
          set -g @catppuccin_flavour "cyberdream"
        '';
      }
      {
        plugin = tmuxPlugins.tmux-fzf;
      }
    ];
  };
}
