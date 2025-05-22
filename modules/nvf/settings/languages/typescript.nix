{
  programs.nvf.settings.vim.languages.ts = {
    enable = true;
    extraDiagnostics.enable = true;
    lsp.server = "ts_ls";
    format = {
      enable = true;
    };
    lsp.enable = true;
    treesitter.enable = true;
    extensions = {
      ts-error-translator = {
        enable = true;
      };
    };
  };
}
