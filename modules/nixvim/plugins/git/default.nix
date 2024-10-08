{...}: {
  imports = [
    ./gitsigns.nix
  ];
  programs.nixvim = {
    plugins = {
      fugitive = {enable = true;};
    };
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>gs";
        action = ":Git<CR>";
        options = {desc = "Git [S]tatus";};
      }
    ];
  };
}
