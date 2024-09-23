{...}: {
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        settings = {
          pickers = {find_files = {hidden = false;};};
          defaults = {
            file_ignore_patterns = [
              "node_modules"
            ];
            # sorting_strategy = "ascending";
          };
        };
        extensions = {
          ui-select = {enable = true;};
          fzf-native = {enable = true;};
        };
        keymaps = {
          "<leader>sh" = {
            action = "help_tags";
            options = {desc = "[S]earch [H]elp";};
            mode = "n";
          };

          "<leader>sl" = {
            action = "keymaps";
            mode = "n";
            options = {desc = "[S]earch [K]eymaps";};
          };

          "<leader>sf" = {
            action = "find_files";
            mode = "n";
            options = {desc = "[S]earch [F]iles";};
          };

          "<leader>ss" = {
            action = "builtin";
            mode = "n";
            options = {desc = "[S]earch [S]elect Telescope";};
          };

          "<leader>sd" = {
            action = "diagnostics";
            mode = "n";
            options = {desc = "[S]earch [D]iagnostics";};
          };

          "<leader>sr" = {
            action = "resume";
            mode = "n";
            options = {desc = "[S]earch [R]esume";};
          };

          "<leader>s." = {
            action = "oldfiles";
            mode = "n";
            options = {desc = "[S]earch Recent Files";};
          };

          "<leader>sg" = {
            action = "live_grep";
            mode = "n";
            options = {desc = "[S]earch by [G]rep";};
          };

          "<leader><leader>" = {
            action = "buffers";
            mode = "n";
            options = {desc = "[ ] Find existing buffers";};
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
        options = {desc = "stuff";};
      }
    ];
  };
}
