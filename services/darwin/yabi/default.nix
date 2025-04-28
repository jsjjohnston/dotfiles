{
  services.yabai = {
    enable = true;
    extraConfig = "
      yabai -m rule --add app='System Settings' space=3
      ";
    config = {
      menubar_opacity = 1.0;
      mouse_follows_focus = false;
      focus_follows_mouse = false;
      display_arrangement_order = "default";
      window_origin_display = "default";
      window_placement = "second_child";
      window_insertion_point = "focused";
      window_animation_duration = 0.0;
      window_animation_easing = "ease_out_circ";
      window_opacity_duration = 0.0;
      active_window_opacity = 1.0;
      normal_window_opacity = 0.9;
      window_opacity = true;
      insert_feedback_color = "0xffd75f5f";
      split_ratio = 0.50;
      split_type = "auto";
      auto_balance = true;
      top_padding = 12;
      bottom_padding = 12;
      left_padding = 12;
      right_padding = 12;

      window_gap = 6;
      mouse_modifier = "fn";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action = "swap";
      window_zoom_persist = true;
      window_shadow = true;
      layout = "bsp";
    };
  };
}
