{ ... }:
{
  programs.nixvim = {
    colorschemes.cyberdream = {
      enable = true;
      settings = {
        borderless_telescope = false;
        transparent = true;
        hide_fillchars = true;
        italic_comments = true;
      };
    };
    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>tt";
        action = ":CyberdreamToggleMode<CR>";
        # TODO: # TODO: Update description for these mappings 
        options = {
          desc = "";
        };
      }
    ];
  };
}
