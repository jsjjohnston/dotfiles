{pkgs, ...}: {
  imports = [
    ./settings/autocomplete/blink-cmp.nix
    ./settings/autocomplete/cmp.nix
    ./settings/binds/whichKey.nix
    ./settings/dashboard/dashboard.nix
    # ./settings/filetree/neo-tree.nix
    # ./settings/filetree/nvimTree.nix
    ./settings/filetree/oil
    ./settings/fzf.nix
    ./settings/git/fugitive.nix
    ./settings/git/git-conflict.nix
    ./settings/git/gitsigns.nix
    ./settings/languages
    ./settings/lsp.nix
    ./settings/mini.nix
    ./settings/notes/neorg
    ./settings/snippets/luasnip.nix
    ./settings/statusline/lualine.nix
    ./settings/telescope.nix
    ./settings/terminal/toggleterm.nix
    ./settings/theme.nix
    ./settings/treesitter.nix
  ];
  programs = {
    nvf = {
      enable = true;
      settings = {
        vim = {
          notes = {
            todo-comments.enable = true;
          };

          autopairs.nvim-autopairs.enable = true;

          formatter.conform-nvim.enable = true;
          luaConfigRC.yanking =
            pkgs.lib.mkAfter
            /*
            lua
            */
            ''
              vim.api.nvim_create_autocmd('TextYankPost', {
                desc = 'Highlight when yanking (copying) text',
                group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
                callback = function()
                  vim.highlight.on_yank()
                end,
              })
            '';
          withNodeJs = true;
          bell = "on";
          comments.comment-nvim.enable = true;

          viAlias = true;
          vimAlias = true;
          spellcheck = {
            enable = true;
            languages = ["en"];
          };
          syntaxHighlighting = true;
          ui = {
            breadcrumbs.enable = true;
            colorizer = {
              enable = true;
              setupOpts = {
                filetypes = {
                  "*" = {
                    RGB = true;
                    RRGGBB = true;
                    always_update = true;
                    css = true;
                    mode = "background";
                  };
                };
              };
            };
            illuminate.enable = true;
            modes-nvim.enable = true;
            smartcolumn.enable = true;
            noice = {
              enable = true;
              # setupOpts = {
              #   routes = {
              #     notify = {
              #       filter = {event = "msg_showmode";};
              #     };
              #   };
              # };
            };
          };
          navigation = {
            harpoon.enable = true;
          };
          utility = {
            icon-picker.enable = true;
            motion = {
              hop.enable = true;
              precognition.enable = true;
            };
            preview.glow.enable = true;
            yazi-nvim = {
              enable = true;
              mappings = {
                yaziToggle = "<C-k>";
              };
            };
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
