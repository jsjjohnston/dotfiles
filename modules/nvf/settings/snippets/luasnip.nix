{
  programs.nvf.settings.vim.snippets.luasnip = {
    enable = true;
    setupOpts = {
      enable_autosnippets = true;
      history = true;
      update_events = "TextChanged,TextChangedI";
      delete_check_events = "TextChanged";
      region_check_events = "InsertEnter";
    };
  };
}
