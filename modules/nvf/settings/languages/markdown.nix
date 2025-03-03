{...}: {
  programs.nvf.settings.vim.languages.markdown = {
    enable = true;
    format.enable = true;
    extensions = {
      render-markdown-nvim.enable = true;
    };
    lsp.enable = true;
    treesitter.enable = true;
  };
}
