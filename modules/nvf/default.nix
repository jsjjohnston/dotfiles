{config, ...}: {
  imports = [
    ./settings/binds/whichKey.nix
    ./settings/autocomplete/cmp.nix
    ./settings/filetree/nvimTree.nix
    ./settings/dashboard/dashboard.nix
    ./settings/vim/fzf.nix
    ./settings/vim/git/gitsigns.nix
    ./settings/vim/git/fugitive.nix
    ./settings/vim/languages
    ./settings/vim/lsp.nix
    ./settings/snippets/luasnip.nix
    ./settings/vim/terminal/toggleterm.nix
    ./settings/vim/telescope.nix
    ./settings/vim/theme.nix
    ./settings/vim/treesitter.nix
  ];

  programs.nvf.enable = !config.programs.nixvim.enable;

  programs.nvf.settings.vim.withNodeJs = true;

  programs.nvf.settings.vim.bell = "on";
  programs.nvf.settings.vim.comments.comment-nvim.enable = true;
  programs.nvf.settings.vim.startPlugins = ["base16"];

  programs.nvf.settings.vim.viAlias = true;
  programs.nvf.settings.vim.vimAlias = true;
  programs.nvf.settings.vim.spellcheck = {
    enable = true;
    languages = ["en"];
  };
  programs.nvf.settings.vim.syntaxHighlighting = true;
  programs.nvf.settings.vim.ui = {
    breadcrumbs.enable = true;
    colorizer.enable = true;
    illuminate.enable = true;
    modes-nvim.enable = true;
    noice.enable = true;
    smartcolumn.enable = true;
  };
  programs.nvf.settings.vim.utility = {
    # ccc.enable = true;
    icon-picker.enable = true;
    motion = {
      hop.enable = true;
      precognition.enable = true;
    };
    preview.glow.enable = true;
  };
  programs.nvf.settings.vim.visuals = {
    fidget-nvim.enable = true;
    indent-blankline.enable = true;
    nvim-web-devicons.enable = true;
  };
  programs.nvf.settings.vim.undoFile.enable = true;
}
