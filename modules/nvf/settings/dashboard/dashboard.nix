{
  programs.nvf.settings.vim.dashboard.dashboard-nvim = {
    enable = true;
    setupOpts = {
      theme = "hyper";
      config = {
        week_header = {
          enable = true;
        };

        shortcut = [
          {
            icon = "󰈞 ";
            desc = "Find File";
            group = "Label";
            action = "Telescope find_files";
            key = "f";
          }
          {
            icon = " ";
            desc = "File Browser";
            group = "Label";
            action = "Telescope file_browser";
            key = "b";
          }
          {
            icon = " ";
            desc = "Config";
            group = "Number";
            action = "edit ~/dotfiles";
            key = "c";
          }
          {
            icon = "󰅚 ";
            desc = "Quit";
            group = "DiagnosticError";
            action = "qa";
            key = "q";
          }
        ];
      };
    };
  };
}
