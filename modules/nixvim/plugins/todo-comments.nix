{ config, lib, ... }:
{
  programs.nixvim.plugins.todo-comments = {
    enable = true;

    keymaps = {
      todoTrouble.key = lib.mkIf config.programs.nixvim.plugins.trouble.enable "<leader>xq";
      todoTelescope = lib.mkIf config.programs.nixvim.plugins.telescope.enable {
        key = "<leader>ft";
        keywords = [
          "TODO"
          "FIX"
          "FIX"
        ];
      };
    };
  };
}
