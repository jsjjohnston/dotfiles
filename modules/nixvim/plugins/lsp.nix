{...}: {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;

      servers = {
        nil-ls = {
          enable = true;
          settings.nix = {
            flake = {
              autoEvalInputs = true;
              autoArchive = true;
            };
            maxMemoryMB = 40960;
          };
        };
        tsserver = {enable = true;};
        eslint = {enable = true;};
      };
    };
  };
}
