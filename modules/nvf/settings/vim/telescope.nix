{...}: {
  programs.nvf.settings.vim.telescope = {
    enable = true;
    setupOpts.defaults.path_display = [
      "smart"
      "tail"
    ];
  };
}
