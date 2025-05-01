{
  programs.nvf.settings.vim.keymaps = [
    {
      key = "\\\\";
      mode = "n";
      silent = false;
      action = "<cmd>lua toggle_oil()<CR>";
      desc = "Toggle Oil file explorer";
    }
  ];
  programs.nvf.settings.vim.extraLuaFiles = [
    ./toggle-oil.lua
  ];
  programs.nvf.settings.vim.utility.oil-nvim = {
    enable = true;
    setupOpts = {
      columns = [
        "icon"
        "permissions"
        "atime"
        "size"
      ];
    };
  };
}
