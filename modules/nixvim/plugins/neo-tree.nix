{ ... }:
{
  programs.nixvim = {
    plugins = {
      neo-tree = {
        enable = true;
        eventHandlers = {
          file_open_requested = ''
            function()
            	require('neo-tree.command').execute({action = 'close'})
            end
          '';
        };
        filesystem = {
          hijackNetrwBehavior = "disabled";
        };
      };
    };

    keymaps = [
      {
        mode = [ "n" ];
        key = "\\";
        action = "<cmd>Neotree toggle<cr>";
        options = {
          desc = "Open/Close Neotree";
        };
        # TODO: Update keymap desc
      }
    ];
  };
}
