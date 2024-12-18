{ config, lib, ... }:
{
  programs.nixvim.plugins.project-nvim = {
    enable = true;
    enableTelescope = true;
  };

  programs.nixvim.keymaps =
    lib.mkIf
      (
        config.programs.nixvim.plugins.telescope.enable
        && config.programs.nixvim.plugins.project-nvim.enable
      )
      [
        {
          mode = "n";
          key = "<leader>fpj";
          action = "<cmd>Telescope projects<CR>";
          options = {
            desc = "Find [P]ro[J]ects";
          };
        }
      ];
}
