{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    stylix.url = "github:danth/stylix";

    nvf.url = "github:notashelf/nvf";
    sops-nix.url = "github:Mic92/sops-nix";

    nixos-hardware.url = "github:Nixos/nixos-hardware/master";
    one-password-shell-plugins.url = "github:1Password/shell-plugins";
  };

  outputs = {
    hyprland-qtutils,
    stylix,
    nixpkgs,
    catppuccin,
    home-manager,
    nvf,
    sops-nix,
    nixos-hardware,
    one-password-shell-plugins,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = system;
      modules = [
        ./configuration.nix
        nixos-hardware.nixosModules.framework-12th-gen-intel
        home-manager.nixosModules.home-manager
        {
          users.users.jay.home = "/home/jay";
          home-manager = {
            useUserPackages = true;
            extraSpecialArgs = {
              inherit inputs;
            };
            sharedModules = [
              sops-nix.homeManagerModules.sops
              nvf.homeManagerModules.default
              stylix.homeManagerModules.stylix
              catppuccin.homeManagerModules.catppuccin
            ];
            users = {
              jay = {
                imports = [
                  ./home.nix
                  one-password-shell-plugins.hmModules.default
                ];
              };
            };
            backupFileExtension = "bkp";
          };
        }
      ];
    };
  };
}
