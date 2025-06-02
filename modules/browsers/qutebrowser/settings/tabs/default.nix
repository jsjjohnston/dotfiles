{
  programs.qutebrowser.settings.tabs = {
    background = true;
    close_mouse_button = "middle";
    close_mouse_button_on_bar = "new-tab";
    favicons = {
      scale = 1.0;
      show = "always";
    };
    focus_stack_size = 10;
    # indicator = {
    #   padding = {
    #     bottom = 2;
    #     left = 0;
    #     right = 4;
    #     top = 2;
    #   };
    # };
    last_close = "ignore";
    max_width = -1;
    min_width = -1;
    mode_on_change = "normal";
    mousewheel_switching = true;
    new_position = {
      related = "next";
      stacking = true;
      unrelated = "last";
    };
    # padding = {
    #   bottom = 0;
    #   left = 5;
    #   right = 5;
    #   top = 0;
    # };
    pinned = {
      frozen = true;
      shrink = true;
    };
    position = "top";
    select_on_remove = "next";
    show = "always";
    show_switching_delay = 800;
    tabs_are_windows = false;
    title = {
      alignment = "left";
      elide = "right";
      format = "{audio}{index}: {current_title}";
      format_pinned = "{index}";
    };
    tooltips = true;
    undo_stack_size = 100;
    width = "15%";
    wrap = true;
  };
}
