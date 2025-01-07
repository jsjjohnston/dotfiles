{
  # TODO: explore https://notashelf.github.io/nvf/index.xhtml#ch-standalone-hm
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
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    stylix.url = "github:danth/stylix";

  };

  outputs =
    {
      hyprland-qtutils,
      stylix,
      nixpkgs,
      catppuccin,
      home-manager,
      nixvim,
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
          home-manager.nixosModules.home-manager
          {
            users.users.jay.home = "/home/jay";
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              sharedModules = [
                stylix.homeManagerModules.stylix
                catppuccin.homeManagerModules.catppuccin
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
