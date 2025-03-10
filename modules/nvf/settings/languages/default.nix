{...}: {
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
  ];
  programs = {
    nvf = {
      settings = {
        vim = {
          languages = {
            enableDAP = true;
            enableExtraDiagnostics = true;
            enableFormat = true;
            enableLSP = true;
            enableTreesitter = true;
          };
        };
      };
    };
  };
}
