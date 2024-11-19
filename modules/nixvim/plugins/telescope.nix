{ ... }:
{
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        settings = {
          pickers = {
            find_files = {
              hidden = false;
            };
          };
          defaults = {
            file_ignore_patterns = [
              "node_modules"
            ];
            # sorting_strategy = "ascending";
          };
        };
        extensions = {
          ui-select = {
            enable = true;
          };
          fzf-native = {
            enable = true;
          };
        };
        keymaps = {
          "<leader>sh" = {
            action = "help_tags";
            options = {
              desc = "[S]earch [H]elp";
            };
            # TODO: Update Keymap desc
            mode = "n";
          };

          "<leader>sl" = {
            action = "keymaps";
            mode = "n";
            options = {
              desc = "[S]earch [K]eymaps";
            };
            # TODO: Update Keymap desc
          };

          "<leader>sf" = {
            action = "find_files";
            mode = "n";
            options = {
              desc = "[S]earch [F]iles";
            };
          };
          # TODO: Update Keymap desc

          "<leader>ss" = {
            action = "builtin";
            mode = "n";
            options = {
              desc = "[S]earch [S]elect Telescope";
            };
            # TODO: Update Keymap desc
          };

          "<leader>sd" = {
            action = "diagnostics";
            mode = "n";
            options = {
              desc = "[S]earch [D]iagnostics";
            };
            # TODO: Update Keymap desc
          };

          "<leader>sr" = {
            action = "resume";
            mode = "n";
            options = {
              desc = "[S]earch [R]esume";
              # TODO: Update Key map Desk
            };
          };

          "<leader>s." = {
            action = "oldfiles";
            mode = "n";
            options = {
              desc = "[S]earch Recent Files";
              # TODO: Update Key map Desk
            };
          };

          "<leader>fg" = {
            action = "live_grep";
            mode = "n";
            options = {
              desc = "[F]ind by [G]rep";
            };
          };

          "<leader><leader>" = {
            action = "buffers";
            mode = "n";
            options = {
              desc = "[ ] Find existing buffers";
              # TODO: Update Key map Desk
            };
          };
        };
      };
    };
    keymaps = [
      {
        key = "<leader>sn";
        action.__raw = ''
          	function()
                   require('telescope.builtin').find_files({ cwd = '~/dotfiles' })
          end
        '';
        mode = "n";
        options = {
          desc = "stuff";
        };
        # TODO: Update Keymap desc
      }
    ];
  };
}
