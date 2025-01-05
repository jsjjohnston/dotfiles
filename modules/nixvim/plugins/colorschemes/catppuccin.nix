{ ... }:
{

  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
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
