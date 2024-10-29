{...}: {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;

      servers = {
        nil_ls = {
          enable = true;
          settings.nix = {
            flake = {
              autoEvalInputs = true;
              autoArchive = true;
            };
            maxMemoryMB = 10240;
          };
        };
        ts_ls = {
          enable = true;
          autostart = true;
        };
        eslint = {enable = true;};
        jsonls = {enable = true;};
      };
    };
  };
}
