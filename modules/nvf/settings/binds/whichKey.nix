{
  programs.nvf.settings.vim.binds.whichKey = {
    enable = true;
    setupOpts = {
      notify = true;
      delay = 300;
      plugins = {
        marks = true;
        registers = true;
        spelling = {
          enabled = true;
          suggestions = 10;
        };
        presets = {
          operators = true;
          motions = true;
          text_objects = true;
          windows = true;
          nav = true;
          z = true;
          g = true;
        };
      };
      preset = "helix";
      replace = {
        key = [
          ["<Space>" "␣"]
          ["<Tab>" "⇥"]
          ["<CR>" "↵"]
        ];
        desc = [
          ["<Plug>%(?(.*)%)?" "%1"]
          ["<[cC]md>" ""]
          ["<[cC][rR]>" ""]
        ];
      };
      win = {
        border = "single";
        title = true;
        title_pos = "center";
        padding = [0 1];
        zindex = 1000;
        no_overlap = true;
        wo = {
          winblend = 15;
        };
        height = {
          max = 10;
        };
      };

      layout = {
        width = {
          min = 25;
        };
        spacing = 2;
      };

      keys = {
        scroll_down = "<C-d>";
        scroll_up = "<C-u>";
      };

      show_help = false;
      show_keys = false;
      debug = false;
    };
  };
}
