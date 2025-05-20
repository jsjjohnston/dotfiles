{
  imports = [
    ./lua.nix
    ./nix.nix
    ./sql.nix
    ./bash.nix
    ./markdown.nix
    ./terraform.nix
    ./nix.nix
    ./typescript.nix
    ./lua.nix
    ./css.nix
    ./yaml.nix
    ./python.nix
  ];
  programs = {
    nvf = {
      settings = {
        vim = {
          lsp = {
            enable = true;
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
