{ config, lib, ... }:
{
  programs.nixvim.plugins.toggleterm = {
    enable = true;

    settings = {
      direction = "float";
    };
  };

  programs.nixvim.keymaps = lib.mkIf config.programs.nixvim.plugins.toggleterm.enable [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>ToggleTerm<CR>";
      options = {
        desc = "Open Terminal";
        # TODO: Update Key Maps
      };
    }
    {
      mode = "n";
      key = "<leader>tg";
      action.__raw = ''
        function()
          local toggleterm = require('toggleterm.terminal')

          toggleterm.Terminal:new({cmd = 'lazygit',hidden = true}):toggle()
        end
      '';
      options = {
        desc = "Open Lazy[G]it";
        # TODO: Update Key Maps
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>jlc";
      action.__raw = ''
        function()
          local toggleterm = require('toggleterm.terminal')

          toggleterm.Terminal:new({cmd = 'jira sprint list --current -a$(jira me)',hidden = true,
          close_on_exit = false}):toggle()
        end
      '';
      options = {
        desc = "[C]urrent sprint";
        # TODO: Update Key Maps
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>jlp";
      action.__raw = ''
        function()
          local toggleterm = require('toggleterm.terminal')

          toggleterm.Terminal:new({cmd = 'jira sprint list --prev',hidden = true,
          close_on_exit = false}):toggle()
        end
      '';
      options = {
        desc = "[P]rev sprint";
        # TODO: Update Key Maps
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>jln";
      action.__raw = ''
        function()
          local toggleterm = require('toggleterm.terminal')

          toggleterm.Terminal:new({cmd = 'jira sprint list --next',hidden = true,
          close_on_exit = false}):toggle()
        end
      '';
      options = {
        desc = "[N]ext sprint";
        # TODO: Update Key Maps
        silent = true;
      };
    }
  ];
}
