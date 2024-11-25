{ config, lib, ... }:
{
  programs.nixvim.plugins = {
    harpoon = {
      enable = true;

      keymapsSilent = true;

      keymaps = {
        addFile = "<leader>ha";
        toggleQuickMenu = "<leader>hm";
        navFile = {
          "1" = "<leader>h1";
          "2" = "<leader>h2";
          "3" = "<leader>h3";
          "4" = "<leader>h4";
        };
      };
    };

    which-key.settings.spec = lib.optionals config.programs.nixvim.plugins.harpoon.enable [
      {
        __unkeyed = "<leader>h";
        group = "Harpoon";
        desc = "[H]arpoon";
        icon = "󱡀 ";
      }
      {
        __unkeyed = "<leader>ha";
        desc = "[A]dd";
      }
      {
        __unkeyed = "<leader>hm";
        desc = "Quick [M]enu";
      }
      {
        __unkeyed = "<leader>h1";
        desc = "1";
      }
      {
        __unkeyed = "<leader>h2";
        desc = "2";
      }
      {
        __unkeyed = "<leader>h3";
        desc = "3";
      }
      {
        __unkeyed = "<leader>h4";
        desc = "4";
      }
    ];
  };
}
