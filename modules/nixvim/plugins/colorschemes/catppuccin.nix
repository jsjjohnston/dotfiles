{ ... }:
{

  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
      settings = {
        transparent_background = true;
        integrations = {
          cmp = true;
          gitsigns = true;
          nvimtree = true;
          treesitter = true;
          notify = false;
          mini = {
            enabled = true;
            indentscope_color = "";
          };
          harpoon = true;
          markdown = true;
          neotree = true;
          neotest = true;
          noice = true;
        };
      };
    };
  };

}
