{config, ...}: {
  programs.nvf.settings.vim.filetree.nvimTree = {
    enable = !config.programs.nvf.settings.vim.filetree.neo-tree.enable;
    mappings = {
      toggle = "\\";
    };
    openOnSetup = false;
  };
}
