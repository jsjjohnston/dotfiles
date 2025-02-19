{...}: {
  programs.nvf.settings.vim = {
    filetree.neo-tree = {
      enable = true;
    };

    keymaps = [
      {
        mode = ["n"];
        key = "\\";
        action = "<cmd>Neotree toggle<cr>";
        desc = "Open/Close Neotree";
      }
    ];
  };
}
