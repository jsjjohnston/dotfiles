{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    inputs = {
      neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    };

    # sddm-sugar-candy-nix = {
    #   url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix/";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      # sddm-sugar-candy-nix,
      hyprland,
      ...
    }@inputs:
    let
      overlays = [
        inputs.neovim-nightly-overlay.overlays.default
      ];
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {

        system = system;
        modules = [
          ./configuration.nix
          # sddm-sugar-candy-nix.nixosModules.default
          # {
          #   nixpkgs = {
          #     overlays = [
          #       sddm-sugar-candy-nix.overlays.default
          #     ];
          #   };
          # }

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              sharedModules = [
                nixvim.homeManagerModules.nixvim
                inputs.anyrun.homeManagerModules.default
                {
                  nixpkgs.overlays = overlays;
                }
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
