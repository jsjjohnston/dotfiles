{ lib, config, ... }:
{
  programs.nixvim.plugins = {
    mini = {
      enable = true;

      modules = {
        diff = {
          view = {
            style = "sign";
          };
        };
      };
    };
  };

  programs.nixvim.keymaps =
    lib.mkIf
      (
        config.programs.nixvim.plugins.mini.enable
        && lib.hasAttr "diff" config.programs.nixvim.plugins.mini.modules
      )
      [
        {
          mode = "n";
          key = "<leader>ugo";
          action.__raw = "MiniDiff.toggle_overlay";
          options = {
            desc = "Git Overlay toggle";
            # # TODO: update keymaps
            silent = true;
          };
        }
      ];
}
