{
  # lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    # ./plugins/bufferline.nix
    # ./plugins/codesnap.nix
    # ./plugins/comment-box.nix
    # ./plugins/complier.nix
    ./keymaps.nix
    ./plugins/autocompletion/cmp.nix
    ./plugins/autoformat/conform.nix
    ./plugins/ccc.nix
    ./plugins/colorizer.nix
    ./plugins/colorschemes/cyberdream.nix
    # ./plugins/colorschemes/catppuccin.nix
    ./plugins/dap.nix
    ./plugins/debugprint.nix
    ./plugins/diffview.nix
    ./plugins/efm.nix
    ./plugins/firenvim.nix
    ./plugins/git
    ./plugins/git-conflict.nix
    ./plugins/git-worktree.nix
    ./plugins/gitignore.nix
    ./plugins/glow.nix
    # ./plugins/hardtime.nix
    ./plugins/harpoon.nix
    ./plugins/hop.nix
    ./plugins/illuminate.nix
    ./plugins/indent-blankline.nix
    ./plugins/lint.nix
    ./plugins/lsp.nix
    ./plugins/lualine.nix
    ./plugins/markdown-preview.nix
    ./plugins/markview.nix
    ./plugins/mini-buffremove.nix
    ./plugins/mini-buffremove.nix
    ./plugins/mini-comment.nix
    ./plugins/mini-diff.nix
    ./plugins/mini-files.nix
    ./plugins/mini-fuzzy.nix
    ./plugins/mini-hipatterns.nix
    ./plugins/mini-starter.nix
    ./plugins/mini-surround.nix
    ./plugins/mini.nix
    ./plugins/navic.nix
    ./plugins/neo-tree.nix
    ./plugins/neotest.nix
    ./plugins/nix.nix
    ./plugins/noice.nix
    ./plugins/nvim-snippets.nix
    ./plugins/otter.nix
    ./plugins/overseer.nix
    ./plugins/package-info.nix
    ./plugins/precognition.nix
    ./plugins/refactoring.nix
    ./plugins/telescope.nix
    ./plugins/tmux-navigator.nix
    ./plugins/todo-comments.nix
    ./plugins/toggleterm.nix
    ./plugins/treesitter.nix
    ./plugins/trouble.nix
    ./plugins/ts-comments.nix
    ./plugins/typescript-tools.nix
    ./plugins/undotree.nix
    ./plugins/wakatime.nix
    ./plugins/which-key.nix
    ./plugins/yanky.nix
    ./plugins/yazi.nix
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    # Use this for now until mini-status builds

    plugins.web-devicons.enable = true;
    plugins.none-ls = {
      enable = true;
    };

    defaultEditor = true;
    enableMan = true;

    # diagnostics = {
    #   update_in_insert = true;
    #   severity_sort = true;
    #   float = {
    #     border = "rounded";
    #   };
    #   jump = {
    #     severity.__raw = "vim.diagnostic.severity.WARN";
    #   };
    # };
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
      undofile = true;
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

    # performance = {
    #   # combinePlugins = {
    #   #   enable = true;
    #   #   standalonePlugins = [
    #   #     "hmts.nvim"
    #   #     "nvim-treesitter"
    #   #     "firenvim"
    #   #   ];
    #   # };
    #   byteCompileLua = {
    #     enable = true;
    #     nvimRuntime = true;
    #     configs = true;
    #     plugins = true;
    #   };
    # };

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
