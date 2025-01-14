{
  description = "Group Services";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=release-24.11";
  };

  outputs =
    { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages."aarch64-darwin";
    in
    {

      devShells."aarch64-darwin".default = pkgs.mkShell {

        packages = [
          pkgs.nodejs_22
          pkgs.yarn
        ];
      };

    };
}
