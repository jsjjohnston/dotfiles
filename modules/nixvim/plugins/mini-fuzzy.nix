{ config, lib, ... }:
{
  programs.nixvim.plugins = {
    mini = {
      enable = true;

      modules = {
        fuzzy = { };
      };
    };

    telescope = {
      settings = {
        defaults =
          lib.mkIf
            (
              config.programs.nixvim.plugins.mini.enable
              && lib.hasAttr "fuzzy" config.programs.nixvim.plugins.mini.modules
            )
            {
              file_sorter.__raw = ''require('mini.fuzzy').get_telescope_sorter'';
              generic_sorter.__raw = ''require('mini.fuzzy').get_telescope_sorter'';
            };
      };
    };
  };
}
