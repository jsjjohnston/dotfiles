{...}: {
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
      };
    };

    keymaps = [
      {
        mode = ["n"];
        key = "\\";
        action = "<cmd>Neotree toggle<cr>";
        options = {desc = "Open/Close Neotree";};
      }
    ];
    autoCmd = [
      {
        event = ["VimEnter"];
        callback = {
          __raw = ''
            	function() 
            		if vim.fn.argc() == 0 then
            			vim.cmd('Neotree close')
            		end
            end'';
        };
      }
    ];
  };
}
