{...}: {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;

      servers = {
        nil-ls = {enable = true;};
        tsserver = {enable = true;};
        eslint = {enable = true;};
      };
    };
  };
}
