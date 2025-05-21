{pkgs, ...}: {
  imports = [
    ./bash.nix
    ./css.nix
    ./lua.nix
    ./markdown.nix
    ./nix.nix
    ./nix.nix
    ./python.nix
    ./sql.nix
    ./terraform.nix
    ./typescript.nix
    ./yaml.nix
  ];
  programs = {
    nvf = {
      settings = {
        vim = {
          lsp = {
            enable = true;
            inlayHints.enable = true;
            lightbulb.autocmd.enable = true;
            lspconfig.enable = true;
            trouble.enable = true;
            servers = {
              marksman = {
                enable = true;
                capabilities = {
                  core.title_from_heading = false;
                };
              };
            };
          };
          languages = {
            enableDAP = true;
            enableExtraDiagnostics = true;
            enableFormat = true;
            enableTreesitter = true;
          };
        };
      };
    };
  };
}
