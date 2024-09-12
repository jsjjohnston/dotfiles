{...}: {
  programs.nixvim = {
    plugins = {
      fugitive = {enable = true;};
    };
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>gs";
        action = "vim.cmd.Git";
        options = {desc = "Git [S]tatus";};
      }
    ];
  };
}
