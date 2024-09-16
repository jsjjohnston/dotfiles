{...}: {
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
    };
    kemaps = [
      {
        mode = ["n"];
        key = "<leader>hs";
        action = "<cmd>gitsigns.stage_hunk<CR>";
        options = {desc = "git [s]tage hunk";};
      }
    ];
  };
}
