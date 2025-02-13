{...}: {
  programs.nvf.settings.vim.lsp = {
    enable = true;
    lspSignature.enable = true;
    lspkind.enable = true;
    # lspsaga.enable = true;

    otter-nvim.enable = true;
    null-ls.enable = true;
    nvim-docs-view.enable = true;
  };
}
