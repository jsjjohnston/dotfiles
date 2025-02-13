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
  programs = {
    nvf = {
      enable = !config.programs.nixvim.enable;
      settings = {
        vim = {
          withNodeJs = true;
          bell = "on";
          comments.comment-nvim.enable = true;
          startPlugins = ["base16"];

          viAlias = true;
          vimAlias = true;
          spellcheck = {
            enable = true;
            languages = ["en"];
          };
          syntaxHighlighting = true;
          ui = {
            breadcrumbs.enable = true;
            colorizer.enable = true;
            illuminate.enable = true;
            modes-nvim.enable = true;
            noice.enable = true;
            smartcolumn.enable = true;
          };
          utility = {
            # ccc.enable = true;
            icon-picker.enable = true;
            motion = {
              hop.enable = true;
              precognition.enable = true;
            };
            preview.glow.enable = true;
          };
          visuals = {
            fidget-nvim.enable = true;
            indent-blankline.enable = true;
            nvim-web-devicons.enable = true;
          };
          undoFile.enable = true;
        };
      };
    };
  };
}
