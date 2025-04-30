{
  programs.nvf.settings.vim.keymaps = [
    {
      key = "\\";
      mode = "n";
      silent = true;
      action =
        /*
        lua
        */
        ''
          -- function()
              -- if vim.bo.filetype == 'oil' then
                -- require("oil.actions").close.callback()
              -- else
                vim.cmd('Oil')
              -- end
          -- end
        '';
    }
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
