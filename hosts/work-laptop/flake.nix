{
  description = "Jays system flake";

  inputs = {
    nixpkgs-stable = {
      url = "github:NixOS/nixpkgs/release-24.11";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

  };

  outputs =
    inputs@{
      catppuccin,
      home-manager,
      mac-app-util,
      neovim-nightly-overlay,
      nix-darwin,
      nixpkgs-stable,
      nixvim,
      nixpkgs,
      self,
    }:
    let
      gitHash =
        { ... }:
        {
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
    in
    {
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
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit pkgs-stable pkgs-unstable inputs;

              };
              sharedModules = [
                catppuccin.homeManagerModules.catppuccin
                nixvim.homeManagerModules.nixvim
                {
                  nixpkgs.overlays = inputs.neovim-nightly-overlay.overlays.default;
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
      # TODO: Work out dev shell
      # devShells."aarch64-darwin".default = pkgs.mkShell {
      #   packages = with pkgs; [
      #     yarn
      #   ];
      # };
    };
}
