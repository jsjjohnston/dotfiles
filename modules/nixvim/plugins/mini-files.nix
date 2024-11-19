{ config, lib, ... }:
{
  programs.nixvim.keymaps =
    lib.mkIf
      (
        config.programs.nixvim.plugins.mini.enable
        && lib.hasAttr "files" config.programs.nixvim.plugins.mini.modules
      )
      [
        {
          mode = "n";
          key = "<leader>E";
          action.__raw = "MiniFiles.open()";
          options = {
            desc = "Mini Files";
            # TODO: Description Update
          };
        }
      ];

  programs.nixvim.plugins = {
    mini = {
      enable = true;

      modules = {
        # files = { };
      };
    };
  };
}
