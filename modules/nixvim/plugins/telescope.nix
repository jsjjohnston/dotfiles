{...}: {
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        extensions = {
          ui-select = {enable = true;};
          fzf-native = {enable = true;};
        };
      };
    };
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>sh";
        action = {__raw = "require('telescope').builtin.help_tags";};
        options = {desc = "[S]earch Help";};
      }
    ];
  };
}
