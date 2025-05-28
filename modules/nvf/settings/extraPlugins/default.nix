{pkgs, ...}: {
  programs.nvf.settings.vim.extraPlugins = with pkgs.vimPlugins; {
    refactoring-nvim = {
      package = refactoring-nvim;
      setup = "require('refactoring').setup {}";
    };
  };
}
