{ ... }:
{
  programs.kitty = {
    enable = true;
    themeFile = "DotGov";
    settings = {
      font_family = "Fira Code";
      bold_dont = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      layout = "fat";
      font_size = 12;
      cursor_blink_interval = "-1 ease-in-out`";
      cursor_stop_blinking_after = 60;
      scrollback_pager_history_size = 512;
      mouse_hide_wait = 5;
      url_color = "#0087bd";
      url_style = "straight";
      show_hyperlink_targets = "yes";
      stripe_trailing_spaces = "smart";
      enable_audio_bell = "yes";
      visual_bell_duration = 1;
      bell_on_tab = "🔔 ";
      draw_minimal_borders = "yes";
      active_border_color = "#00ff00";
      inactive_border_color = "#cccccc";
      bell_border_color = "#ff5a00";
      tab_bar_style = "powerline";
      background_opacity = 0;
      editor = "vim";
      allow_remote_control = "yes";
    };
  };
}
