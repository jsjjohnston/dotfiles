{
  imports = [
    ./nvim-lint
  ];
  programs.nvf.settings.vim.diagnostics = {
    enable = true;
    config = {
      virtual_text = true;
    };
  };
}
