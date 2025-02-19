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

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    mac-app-util.url = "github:hraban/mac-app-util";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = inputs @ {
    home-manager,
    mac-app-util,
    neovim-nightly-overlay,
    nix-darwin,
    nixpkgs-stable,
    nixvim,
    nixpkgs,
    nvf,
    self,
  }: let
    gitHash = {...}: {
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
        mac-app-util.darwinModules.default
        gitHash
        ./configuration.nix
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
              nvf.homeManagerModules.default

              nixvim.homeManagerModules.nixvim
              {
                nixpkgs.overlays = [inputs.neovim-nightly-overlay.overlays.default];
              }
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

    devShells.aarch64-darwin.montu-group-services = pkgs-unstable.mkShell {
      name = "montu-group-services";

      buildInputs = [
        pkgs-unstable.jq
        pkgs-unstable.python3
        (pkgs-unstable.yarn.overrideAttrs (oldAttrs: {
          buildInputs = pkgs-unstable.nodejs_18;
        }))
        pkgs-unstable.nodePackages_latest.aws-cdk
        pkgs-unstable.cacert
        pkgs-unstable.nodejs_18
      ];

      shellHook = ''
        echo "Welcome to the montu-group-services dev environment!"
        echo "Node version: $(node -v)"
        echo "Yarn version: $(yarn -v)"
        export PATH=$(echo "$PATH" | tr ':' '\n' | awk '!seen[$0]++' | tr '\n' ':' | sed 's/:$//')
      '';
    };
  };
}
