{
  description = "Jays system flake";

  inputs = {
    nixpkgs-stable = {
      url = "github:NixOS/nixpkgs/release-24.11";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util.url = "github:hraban/mac-app-util";
    nvf.url = "github:notashelf/nvf";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = inputs @ {
    home-manager,
    mac-app-util,
    nix-darwin,
    nixpkgs,
    nixpkgs-stable,
    nvf,
    self,
    sops-nix,
  }: let
    gitHash = _: {
      system.configurationRevision = self.rev or self.dirtyRev or null;
    };
    system = "aarch64-darwin";

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
    pkgs-unstable = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    darwinConfigurations.work-laptop = nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit pkgs-unstable pkgs-stable inputs;
      };
      modules = [
        ./configuration.nix
        gitHash
        mac-app-util.darwinModules.default
        home-manager.darwinModules.home-manager
        {
          users.users.jay.home = "/Users/jay";
          home-manager = {
            useGlobalPkgs = false;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit pkgs-stable pkgs-unstable inputs;
            };
            sharedModules = [
              sops-nix.homeManagerModules.sops

              nvf.homeManagerModules.default
            ];
            users = {
              jay = {
                imports = [
                  mac-app-util.homeManagerModules.default
                  ./home.nix
                ];
              };
            };
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
