{ config, lib, ... }:
{
  programs.nixvim.plugins = {
    git-conflict = {
      enable = true;

      settings = {
        disable_diagnostics = true;
        default_mappings = {
          ours = "co";
          theirs = "ct";
          none = "c0";
          both = "cb";
          next = "]x";
          prev = "[x";
        };
      };
    };

    which-key.settings.spec = lib.optionals config.programs.nixvim.plugins.git-conflict.enable [
      {
        __unkeyed = "<leader>gc";
        group = "[C]onflicts";
        icon = "";
      }
    ];
  };

  programs.nixvim.keymaps = lib.mkIf config.programs.nixvim.plugins.git-conflict.enable [
    {
      mode = "n";
      key = "<leader>gc]";
      action = "<cmd>GitConflictNextConflict<CR>";
      options = {
        desc = "Next"; # # TODO: Update description for these mappings
      };
    }
    {
      mode = "n";
      key = "<leader>gc[";
      action = "<cmd>GitConflictPrevConflict<CR>";
      options = {
        desc = "Prev"; # # TODO: Update description for these mappings
      };
    }
    {
      mode = "n";
      key = "<leader>gcr";
      action = "<cmd>GitConflictRefresh<CR>";
      options = {
        desc = "Git Conflict [R]efresh";
      };
    }
    {
      mode = "n";
      key = "<leader>gcb";
      action = "<cmd>GitConflictChooseBase<CR>";
      options = {
        desc = "Git Conflict Choose [b]ase";
      };
    }
    {
      mode = "n";
      key = "<leader>gcB";
      action = "<cmd>GitConflictChooseBoth<CR>";
      options = {
        desc = "Git Conflict Choose [B]oth";
      };
    }
    {
      mode = "n";
      key = "<leader>gct";
      action = "<cmd>GitConflictChooseTheirs<CR>";
      options = {
        desc = "Git Conflict Choose [T]heirs";
      };
    }
    {
      mode = "n";
      key = "<leader>gco";
      action = "<cmd>GitConflictChooseOurs<CR>";
      options = {
        desc = "Git Conflict Choose [O]urs";
      };
    }
    {
      mode = "n";
      key = "<leader>gcn";
      action = "<cmd>GitConflictChooseNone<CR>";
      options = {
        desc = "Git Conflict Choose [N]one";
      };
    }
    {
      mode = "n";
      key = "<leader>gcl";
      action = "<cmd>GitConflictListQf<CR>";
      options = {
        desc = "Git Conflict [L]ist";
      };
    }
  ];
}
