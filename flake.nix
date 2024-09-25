{
  description = "Jays Nixos Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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

    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixvim,
    sddm-sugar-candy-nix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs;
  in {
    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        inherit nixvim;
      };
      system = system;
      modules = [
        ./hosts/server/configuration.nix
        ./settings/flakes.nix
        ./settings/system-packages.nix
        # ./services/ollama
        ./services/openssh
        ./virtualisation/home-assistant
        inputs.home-manager.nixosModules.default

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
            sharedModules = [nixvim.homeManagerModules.nixvim];
            users = {
              "jay" = import ./hosts/server/home.nix;
            };
            backupFileExtension = "backup";
          };
        }
      ];
    };
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        inherit nixvim;
      };
      system = system;
      modules = [
        ./settings/flakes.nix
        ./hosts/laptop/configuration.nix
        ./settings/system-packages.nix
        inputs.home-manager.nixosModules.default
        sddm-sugar-candy-nix.nixosModules.default
        {
          nixpkgs = {
            overlays = [
              sddm-sugar-candy-nix.overlays.default
            ];
          };
        }

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            extraSpecialArgs = {inherit inputs;};
            sharedModules = [
              nixvim.homeManagerModules.nixvim
              inputs.anyrun.homeManagerModules.default
            ];
            users = {
              "jay" = import ./hosts/laptop/home.nix;
            };
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
