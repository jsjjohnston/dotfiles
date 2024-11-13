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
        group = "Conflicts";
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
        desc = "Refresh"; # # TODO: Update description for these mappings
      };
    }
    {
      mode = "n";
      key = "<leader>gcb";
      action = "<cmd>GitConflictChooseBase<CR>";
      options = {
        desc = "Choose Base"; # # TODO: Update description for these mappings
      };
    }
    {
      mode = "n";
      key = "<leader>gcB";
      action = "<cmd>GitConflictChooseBoth<CR>";
      options = {
        desc = "Choose Both"; # # TODO: Update description for these mappings
      };
    }
    {
      mode = "n";
      key = "<leader>gct";
      action = "<cmd>GitConflictChooseTheirs<CR>";
      options = {
        desc = "Choose Theirs"; # # TODO: Update description for these mappings
      };
    }
    {
      mode = "n";
      key = "<leader>gco";
      action = "<cmd>GitConflictChooseOurs<CR>";
      options = {
        desc = "Choose Ours"; # # TODO: Update description for these mappings
      };
    }
    {
      mode = "n";
      key = "<leader>gcn";
      action = "<cmd>GitConflictChooseNone<CR>";
      options = {
        desc = "Choose None"; # # TODO: Update description for these mappings
      };
    }
    {
      mode = "n";
      key = "<leader>gcl";
      action = "<cmd>GitConflictListQf<CR>";
      options = {
        desc = "List"; # # TODO: Update description for these mappings
      };
    }
  ];
}
