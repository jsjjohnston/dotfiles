{
  lib,
  pkgs,
  ...
}: {
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
    ./plugins/mini/mini-status.nix
    ./plugins/todo-comments.nix
   ./plugins/indent-blankline.nix
    ./plugins/lint.nix
     ./plugins/airline.nix
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    enableMan = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;

      NERDTreeShowHidden = 1;
    };

    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;
      clipboard.register = "unnamedplus";
      # clipboard.providers.xclip.enable = true;
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
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
    };

    autoCmd = [
      {
        event = ["TextYankPost"];
        desc = "Highlight when yanking (copying) text";
        group = "highlight-yank";
        callback = {__raw = "function() vim.highlight.on_yank() end";};
      }
    ];

    autoGroups.highlight-yank.clear = true;

    keymaps = [
      {
        mode = ["n"];
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
        options = {desc = "Escape";};
      }

      {
        mode = ["n"];
        key = "[d";
        action = "vim.diagnostic.goto_prev";
        options = {desc = "Go to previous [D]iagnostic message";};
      }

      {
        mode = ["n"];
        key = "]d";
        action = "vim.diagnostic.goto_next";
        options = {desc = "Go to next [D]iagnostic message";};
      }

      {
        mode = ["n"];
        key = "<leader>e";
        action = "vim.diagnostic.open_float";
        options = {desc = "Show diagnostic [E]rror messages";};
      }

      {
        mode = ["n"];
        key = "<leader>q";
        action = "vim.diagnostic.setloclist";
        options = {desc = "Open diagnostic [Q]uickfix list";};
      }

      {
        mode = ["t"];
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
        options = {desc = "Exit terminal mode";};
      }

      {
        mode = ["n"];
        key = "<C-h>";
        action = "<C-w><C-h>";
        options = {desc = "Move focus to the left window";};
      }

      {
        mode = ["n"];
        key = "<C-l>";
        action = "<C-w><C-l>";
        options = {desc = "Move focus to the right window";};
      }

      {
        mode = ["n"];
        key = "<C-j>";
        action = "<C-w><C-j>";
        options = {desc = "Move focus to the lower window";};
      }

      {
        mode = ["n"];
        key = "<C-k>";
        action = "<C-w><C-k>";
        options = {desc = "Move focus to the upper window";};
      }
    ];

    performance = {
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "hmts.nvim"
          "nvim-treesitter"
        ];
      };
      byteCompileLua.enable = true;
    };

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
