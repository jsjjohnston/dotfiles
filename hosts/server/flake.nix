{
  description = "A very basic flake server";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = {
    nixpkgs,
    catppuccin,
    home-manager,
    nvf,
    sops-nix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
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
              catppuccin.homeManagerModules.catppuccin
            ];
            users = {
              jay = {
                imports = [
                  ./home.nix
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
