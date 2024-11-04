{ config, lib, ... }:
{
  programs.nixvim.plugins.package-info = {
    enable = true;
    enableTelescope = true;
  };

  programs.nixvim.keymaps =
    lib.mkIf
      (
        config.programs.nixvim.plugins.telescope.enable
        && config.programs.nixvim.plugins.package-info.enable
      )
      [
        {
          mode = "n";
          key = "<leader>fP";
          action = "<cmd>Telescope package_info<CR>";
          options = {
            desc = "Find package info";
          };
        }
      ];
}
