{
  description = "Jays system flake";

  inputs = {
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
    # nix-ld.url = "github:Mic92/nix-ld";
    # nix-ld.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    inputs@{
      self,
      home-manager,
      nixvim,
      nix-darwin,
      nixpkgs,
      neovim-nightly-overlay,
    # nix-ld,
    }:
    {
      darwinConfigurations.work-laptop = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./configuration.nix

          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              sharedModules = [
                nixvim.homeManagerModules.nixvim
                {
                  nixpkgs.overlays = inputs.neovim-nightly-overlay.overlays.default;
                } # nix-ld.nixosModules.nix-ld
              ];
              users = {
                "jay" = import ./home.nix;
              };
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
