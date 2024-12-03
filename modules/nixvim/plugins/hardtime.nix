{ config, lib, ... }:
let
  cfg = config.programs.nixvim.plugins.hardtime;
in
{
  programs.nixvim.plugins = {
    hardtime = {
      enable = true;

      settings = {
        enabled = true;
        disable_mouse = false;
      };
    };

    which-key.settings.spec = lib.optionals config.programs.nixvim.plugins.hardtime.enable [
      {
        __unkeyed = "<leader>v";
        mode = "n";
        group = "Vim training";
        icon = "󱛊";
      }
    ];
  };

  programs.nixvim.keymaps = lib.mkIf cfg.enable [
    {
      mode = "n";
      key = "<leader>th";
      action.__raw = ''
        function ()
          vim.g.disable_hardtime = not vim.g.disable_hardtime
          if vim.g.disable_hardtime then
            require("hardtime").disable()
          else
            require("hardtime").enable()
          end
          -- vim.notify(string.format("Hardtime %s", bool2str(not vim.g.disable_hardtime), "info"))
        end
      '';
      options = {
        desc = "[T]oggle [H]ardtime";
        silent = true;
      };
    }
  ];
}
