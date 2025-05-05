{
  programs.nvf.settings.vim.languages.markdown = {
    enable = true;
    format.enable = true;
    extensions = {
      render-markdown-nvim = {
        setupOpts.latex = {enabled = false;};
        setupOpts.html = {enabled = false;};
        enable = true;
      };
    };
    lsp.enable = true;
    treesitter.enable = true;
  };
}
