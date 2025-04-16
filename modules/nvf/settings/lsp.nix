{config, ...}: {
  programs.nvf.settings.vim.lsp = {
    enable = true;
    lspSignature.enable = !config.programs.nvf.settings.vim.autocomplete.blink-cmp.enable;
    lspkind.enable = true;

    otter-nvim.enable = true;
    null-ls.enable = true;
    nvim-docs-view.enable = true;
    trouble.enable = true;
  };
}
