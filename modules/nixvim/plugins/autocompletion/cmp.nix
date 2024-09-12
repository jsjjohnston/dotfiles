{...}: {
  programs.nixvim = {
    plugins = {
      luasnip = {enable = true;};

      cmp = {
        enable = true;
        autoEnableSources = true;

        setting.sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];
      };
    };
  };
}
