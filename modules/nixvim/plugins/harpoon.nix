{ config, lib, ... }:
{
  programs.nixvim.plugins = {
    harpoon = {
      enable = true;

      keymapsSilent = true;

      keymaps = {
        addFile = "<leader>ha";
        toggleQuickMenu = "<leader>he";
        navFile = {
          "1" = "<leader>hj";
          "2" = "<leader>hk";
          "3" = "<leader>hl";
          "4" = "<leader>hm";
        };
      };
    };

    which-key.settings.spec = lib.optionals config.programs.nixvim.plugins.harpoon.enable [
      # TODO: # TODO: update kepmap
      {
        __unkeyed = "<leader>h";
        group = "Harpoon";
        icon = "󱡀 ";
      }
      {
        __unkeyed = "<leader>ha";
        desc = "Add";
        # # TODO: Update Description
      }
      {
        __unkeyed = "<leader>he";
        desc = "QuickMenu";
        # # TODO: Update Description
      }
      {
        __unkeyed = "<leader>hj";
        desc = "1";
        # # TODO: Update Description
      }
      {
        __unkeyed = "<leader>hk";
        desc = "2";
        # # TODO: Update Description
      }
      {
        __unkeyed = "<leader>hl";
        desc = "3";
        # # TODO: Update Description
      }
      {
        __unkeyed = "<leader>hm";
        desc = "4";
        # # TODO: Update Description
      }
    ];
  };
}
