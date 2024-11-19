{ ... }:
{

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<esc>";
      action = "<cmd>nohc<CR>";
      # TODO: Update keymap desc
    }
    {
      mode = "n";
      key = "<BS>";
      action = "<BS>x";
    }
    {
      mode = "n";
      key = "Y";
      action = "y$";
      # TODO: add description
    }
    {
      mode = "n";
      key = "<C-c>";
      action = "<cmd>b#<CR>";
      # TODO: add description
    }
    {
      mode = "n";
      key = "<leader>[";
      action = "<C-w>h";
      options = {
        desc = "Left window";
        # TODO: Update Description
      };
    }
    {
      mode = "n";
      key = "<leader>]";
      action = "<C-w>l";
      options = {
        desc = "Right window";
        # TODO: Update Description
      };
    }
    {
      mode = "n";
      key = "<leader>,";
      action = "<C-w>k";
      options = {
        desc = "Down window";
        # TODO: Update Description
      };
    }
    {
      mode = "n";
      key = "<leader>.";
      action = "<C-w>k";
      options = {
        desc = "Up window";
        # TODO: Update Description
      };
    }
    {
      mode = "n";
      key = "<C-[>";
      action = "<cmd>cnext<CR>";
      # TODO: add description
    }
    {
      mode = "n";
      key = "<C-]>";
      action = "<cmd>cprev<CR>";
      # TODO: add description
    }
    {
      mode = "n";
      key = "<C-Up>";
      action = "<cmd>resize -2<CR>";
      # TODO: add description
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = "<cmd>resize +2<CR>";
      # TODO: add description
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = "<cmd>vertical resize +2<CR>";
      # TODO: add description
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = "<cmd>vertical resize -2<CR>";
      # TODO: add description
    }
    {
      mode = "n";
      key = "<M-k>";
      action = "<cmd>move-2<CR>";
      # TODO: add description
    }
    {
      mode = "n";
      key = "<M-j>";
      action = "<cmd>move+<CR>";
      # TODO: add description
    }
    {
      mode = "n";
      key = "<C-n>";
      action = "<cmd>enew<CR>";
      # TODO: add description
    }
  ];
}
