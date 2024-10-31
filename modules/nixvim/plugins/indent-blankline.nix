{ config, lib, ... }:
{
  programs.nixvim.plugins = {
    indent-blankline = {
      enable = true;

      settings = {
        scope.enabled = false;
      };
    };
  };

  programs.nixvim.keymaps = lib.optionals config.programs.nixvim.plugins.indent-blankline.enable [
    {
      mode = "n";
      key = "<leader>ui";
      action = "<cmd>IBLToggle<CR>";
      options = {
        desc = "Indent-Blankline toggle";
      };
    }
    {
      mode = "n";
      key = "<leader>uI";
      action = "<cmd>IBLToggleScope<CR>";
      options = {
        desc = "Indent-Blankline Scope toggle";
      };
    }
  ];
}
