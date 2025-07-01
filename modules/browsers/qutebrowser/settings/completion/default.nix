{
  programs.qutebrowser.settings.completion = {
    cmd_history_max_items = -1;
    delay = 0;
    favorite_paths = [];
    height = "50%";
    min_chars = 1;
    open_categories = [
      "searchengines"
      "quickmarks"
      "bookmarks"
      "history"
      "filesystem"
    ];
    quick = true;
    scrollbar = {
      padding = 2;
      width = 12;
    };
    show = "always";
    shrink = true;
    timestamp_format = " %Y-%m-%d %H:%M";
    use_best_match = true;
    web_history = {
      exclude = [];
      max_items = -1;
    };
  };
}
