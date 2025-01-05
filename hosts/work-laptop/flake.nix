{
  description = "Jays system flake";

  inputs = {
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
      self,
      home-manager,
      nixvim,
      nix-darwin,
      mac-app-util,
      catppuccin,
    }:
    let
      gitHash =
        { ... }:
        {
          system.configurationRevision = self.rev or self.dirtyRev or null;
        };
    in
    {
      darwinConfigurations.work-laptop = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
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
                inherit inputs;
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
