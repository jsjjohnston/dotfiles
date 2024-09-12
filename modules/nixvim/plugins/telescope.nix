{...}: {
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        extensions = {
          ui-select = {enable = true;};
          fzf-native = {enable = true;};
        };
        keymaps = {
          "<leader>sh" = {
            action = "help_tags";
            options = {desc = "[S]earch [H]elp";};
            mode = "n";
          };
          "<leader>sg" = "live_grep";
        };
      };
    };
  };
}
