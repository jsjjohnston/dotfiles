{...}: {
  programs.nvf.settings.vim.languages.sql = {
    enable = true;
    extraDiagnostics.enable = true;
    format.enable = true;
    lsp.enable = true;
    treesitter.enable = true;
  };
}
