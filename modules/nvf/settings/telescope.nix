{
  programs.nvf.settings.vim.telescope = {
    enable = true;
    setupOpts.defaults = {
      layout_strategy = "horizontal";
      layout_config = {
        horizontal.prompt_position = "top";
        horizontal.preview_width = 0.6;
        width = 0.9;
        height = 0.85;
        preview_cutoff = 120;
      };

      sorting_strategy = "ascending";
      scroll_strategy = "cycle";
      file_ignore_patterns = [
        "%.git/"
        "node_modules/"
        "%.cache/"
        "dist/"
        "target/"
        "%.venv/"
      ];
      path_display = [
        "smart"
        "tail"
      ];
    };
  };
}
