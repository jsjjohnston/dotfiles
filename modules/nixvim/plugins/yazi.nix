{ config, lib, ... }:
{
  programs.nixvim.plugins.yazi.enable = true;

  programs.nixvim.keymaps = lib.optionals config.programs.nixvim.plugins.yazi.enable [
    {
      mode = "n";
      key = "<leader>ty";
      action.__raw = ''
        function()
          require('yazi').yazi()
        end
      '';
      options = {
        desc = "[Y]azi";
        # TODO: Update Descrip
        silent = true;
      };
    }
  ];
}
