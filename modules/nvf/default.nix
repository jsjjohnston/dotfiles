{ config, ... }:
{

  programs.nvf = {
    enable = !config.programs.nixvim.enable;
    settings = {
      vim.autocomplete.nvim-cmp = {
      enable = true;
      sourcePlugins = [
        "base16"
        "ccc"
        "cheatsheet-nvim"
        "cmp-buffer"
        "cmp-luasnip"
        "cmp-nvim-lsp"
        "cmp-path"  
        "cmp-treesitter"
        "comment-nvim"
        "friendly-snippets"
        "fzf-lua"
        "gitsigns-nvim"
        "highlight-undo"
        "hop-nvim"
        "icon-picker-nvim"
        "image-nvim"
        "indent-blankline"
        "lsp-lines"
        "lsp-signature"
        "lspsaga"
        "lz-n"
        "mini-animate"
        
      ];
      };
      vim.bell = "on";
      vim.binds.whichKey = {
enable = true;
      };
      vim.comments.comment-nvim.enable = true;
      vim.dashboard.dashboard-nvim= {enable = true;
      setupOpts = {};};
      vim.filetree.nvimTree = {
enable = true;
mappings = { toggle = "\\"; };
openOnSetup = false;
      };
      vim.viAlias = true;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };
    };
  };
}
