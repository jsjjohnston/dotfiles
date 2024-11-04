{
  # lib,
  pkgs,
  ...
}:
{
  imports = [
    ./plugins/neo-tree.nix
    ./plugins/lsp.nix
    ./plugins/colorschemes/cyberdream.nix
    ./plugins/which-key.nix
    ./plugins/autoformat/conform.nix
    ./plugins/autocompletion/cmp.nix
    ./plugins/telescope.nix
    ./plugins/git
    ./plugins/bufferline.nix
    ./plugins/treesitter.nix
    ./plugins/todo-comments.nix
    ./plugins/indent-blankline.nix
    ./plugins/lint.nix
    ./plugins/typescript-tools.nix
    ./plugins/ccc.nix
    ./plugins/codesnap.nix
    ./plugins/colorizer.nix
    ./plugins/comment-box.nix
    ./plugins/complier.nix
    ./plugins/dap.nix
    ./plugins/diffview.nix
    ./plugins/debugprint.nix
    ./plugins/efm.nix
    ./plugins/firenvim.nix
    ./plugins/git-conflict.nix
    ./plugins/git-worktree.nix
    ./plugins/gitignore.nix
    ./plugins/glow.nix
    ./plugins/hardtime.nix
    ./plugins/harpoon.nix
    ./plugins/hop.nix
    ./plugins/illuminate.nix
    ./plugins/markdown-preview.nix
    ./plugins/markview.nix
    ./plugins/mini.nix
    ./plugins/mini-buffremove.nix
    ./plugins/mini-comment.nix
    ./plugins/mini-diff.nix
    ./plugins/mini-files.nix
    ./plugins/mini-fuzzy.nix
    ./plugins/lualine.nix
    ./plugins/mini-starter.nix
    ./plugins/mini-hipatterns.nix
    ./plugins/mini-buffremove.nix
    ./plugins/mini-surround.nix
    ./plugins/navic.nix
    ./plugins/neotest.nix
    ./plugins/nix.nix
    ./plugins/noice.nix
    ./plugins/otter.nix
    ./plugins/overseer.nix
    ./plugins/package-info.nix
    ./plugins/precognition.nix
    ./plugins/refactoring.nix
    ./plugins/rest.nix
    ./plugins/toggleterm.nix
    ./plugins/trouble.nix
    ./plugins/ts-comments.nix
    ./plugins/undotree.nix
    ./plugins/wakatime.nix
    ./plugins/yanky.nix
    ./plugins/yazi.nix
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;

    # Use this for now untill mini-status builds
    plugins.web-devicons.enable = true;
    plugins.none-ls = {
      enable = true;
    };

    defaultEditor = true;
    enableMan = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;

      NERDTreeShowHidden = 1;
      # Custom for toggles
      disable_diagnostics = false;
      disable_hardtime = false;
      disable_autoformat = false;
      spell_enabled = true;
      colorizing_enabled = 1;
      first_buffer_opened = false;
    };

    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      mousemodel = "extend";
      showmode = false;
      spell = true;
      spelllang = "en_au";
      clipboard = {
        register = "unnamedplus";

        providers = {
          wl-copy = {
            enable = true;
            package = pkgs.wl-clipboard;
          };
        };
      };
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 100;
      hidden = true;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      list = true;
      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };
      inccommand = "split";
      cursorline = true;
      scrolloff = 10;
      hlsearch = true;
      expandtab = true;
      swapfile = false;
      modeline = true;
      modelines = 100;
      undofle = true;
      incsearch = true;
      laststatus = 3;
      termguicolors = true;
      wrap = false;

      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 0;
      autoindent = true;

    };

    autoCmd = [
      {
        event = [ "TextYankPost" ];
        desc = "Highlight when yanking (copying) text";
        group = "highlight-yank";
        callback = {
          __raw = "function() vim.highlight.on_yank() end";
        };
      }
    ];

    autoGroups.highlight-yank.clear = true;

    performance = {
      # combinePlugins = {
      #   enable = true;
      #   standalonePlugins = [
      #     "hmts.nvim"
      #     "nvim-treesitter"
      #   ];
      # };
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        configs = true;
        plugins = true;
      };
    };

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
