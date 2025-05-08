{
  programs = {
    nvf = {
      settings = {
        vim = {
          keymaps = [
            {
              key = "\\\\";
              mode = "n";
              silent = false;
              action = "<cmd>lua toggle_oil()<CR>";
              desc = "Toggle Oil file explorer";
            }
          ];
          extraLuaFiles = [
            ./toggle-oil.lua
          ];
          utility.oil-nvim = {
            enable = true;
            setupOpts = {
              setupOpts = {
                columns = [
                  "icon"
                  "permissions"
                  "atime"
                  "size"
                ];

                view_options = {
                  show_hidden = true;
                  natural_order = true;
                };

                float = {
                  padding = 2;
                  max_width = 80;
                  max_height = 20;
                  border = "rounded";
                  win_options = {
                    winblend = 10;
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
