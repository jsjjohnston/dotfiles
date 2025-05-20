{
  programs.nvf.settings.vim.languages.markdown = {
    enable = true;
    format = {
      enable = true;
      type = "prettierd";
    };
    extraDiagnostics.enable = true;
    extensions = {
      markview-nvim.enable = true;
    };
    lsp.enable = true;
    treesitter.enable = true;
  };
}
