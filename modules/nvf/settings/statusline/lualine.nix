{
  programs.nvf.settings.vim.statusline.lualine = {
    enable = true;
    setupOpts = {
      options = {
        theme = "auto";
        icons_enabled = true;
        section_separators = ["" ""];
        component_separators = ["" ""];
      };

      sections = {
        lualine_a = ["mode"];
        lualine_b = ["branch" "diff" "diagnostics"];
        lualine_c = ["filename"];
        lualine_x = ["filetype"];
        lualine_y = ["progress"];
        lualine_z = ["location"];
      };
    };
  };
}
