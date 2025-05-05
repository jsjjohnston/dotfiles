{pkgs, ...}: {
  imports = [
    ./settings/autocomplete/blink-cmp.nix
    ./settings/autocomplete/cmp.nix
    ./settings/autopairs
    ./settings/binds/whichKey.nix
    ./settings/dashboard/dashboard.nix
    ./settings/diagnostics
    ./settings/filetree/neo-tree.nix
    ./settings/filetree/oil
    ./settings/formatter/conform
    ./settings/fzf.nix
    ./settings/git/fugitive.nix
    ./settings/git/git-conflict.nix
    ./settings/git/gitsigns.nix
    ./settings/languages
    ./settings/lsp.nix
    ./settings/mini.nix
    ./settings/notes/neorg
    ./settings/notes/todo
    ./settings/snippets/luasnip.nix
    ./settings/statusline/lualine.nix
    ./settings/telescope.nix
    ./settings/terminal/toggleterm.nix
    ./settings/theme.nix
    ./settings/treesitter.nix
    ./settings/notifications/notify
  ];
  programs = {
    nvf = {
      enable = true;
      settings = {
        vim = {
          enableLuaLoader = true;
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
            programmingWordlist.enable = true;
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
              setupOpts = {
                lsp = {
                  signature.enabled = true;
                  hover.enabled = true;
                  progress.enabled = false;
                };
                presets = {
                  bottom_search = true;
                  command_palette = true;
                  long_message_to_split = true;
                  lsp_doc_border = true;
                };
                views.mini.win_options.winblend = 10;
              };
            };
          };
          navigation = {
            harpoon.enable = true;
          };
          utility = {
            icon-picker.enable = true;
            motion = {
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
