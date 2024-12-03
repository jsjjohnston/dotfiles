{ config, lib, ... }:
{
  programs.nixvim.plugins = {
    refactoring = {
      enable = true;
      enableTelescope = true;
    };

    which-key.settings.spec = lib.optionals config.programs.nixvim.plugins.refactoring.enable [
      {
        __unkeyed = "<leader>r";
        mode = "x";
        group = "[R]efactor";
        icon = " ";
      }
    ];
  };

  programs.nixvim.keymaps =
    lib.optionals config.programs.nixvim.plugins.refactoring.enable [
      {
        mode = "x";
        key = "<leader>re";
        action = "<cmd>Refactor extract<cr>";
        options = {
          desc = "[E]xtract";
        };
      }
      {
        mode = "x";
        key = "<leader>rf";
        action = "<cmd>Refactor extract_to_file<cr>";
        options = {
          desc = "Extract to [F]ile";
        };
      }
      {
        mode = "x";
        key = "<leader>rv";
        action = "cmd>Refactor extract_var<cr>";
        options = {
          desc = "Extract var";
          # TODO: Update Keymap desc
        };
      }
      {
        mode = "n";
        key = "<leader>ri";
        action = "<cmd>Refactor inline_var<CR>";
        options = {
          desc = "Inline var";
          # TODO: Update Keymap desc
        };
      }
      {
        mode = "n";
        key = "<leader>rI";
        action = "<cmd>Refactor inline_func<CR>";
        options = {
          desc = "Inline Func";
          # TODO: Update Keymap desc
        };
      }
      {
        mode = "n";
        key = "<leader>rb";
        action = "<cmd>Refactor extract_block<CR>";
        options = {
          desc = "Extract block";
          # TODO: Update Keymap desc
        };
      }
      {
        mode = "n";
        key = "<leader>rB";
        action = "<cmd>Refactor extract_block_to_file<CR>";
        options = {
          desc = "Extract block to file";
          # TODO: Update Keymap desc
        };
      }
    ]
    ++ lib.optionals
      (
        config.programs.nixvim.plugins.telescope.enable && config.programs.nixvim.plugins.refactoring.enable
      )
      [
        {
          mode = "n";
          key = "<leader>fR";
          action.__raw = ''
            function()
              require('telescope').extensions.refactoring.refactors()
            end
          '';
          options = {
            desc = "Refactoring";
            # TODO: Update Keymap desc
            silent = true;
          };
        }
      ];
}
