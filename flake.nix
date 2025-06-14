{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/release-24.11";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    mac-app-util.url = "github:hraban/mac-app-util";
    # catppuccin.url = "github:catppuccin/nix";
    # catppuccin.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    stylix.url = "github:danth/stylix";
    nvf.url = "github:notashelf/nvf";
    sops-nix.url = "github:Mic92/sops-nix";
    nixos-hardware.url = "github:Nixos/nixos-hardware/master";
    one-password-shell-plugins.url = "github:1Password/shell-plugins";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    ...
  }: let
    gitHash = _: {system.configurationRevision = self.rev or self.dirtyRev or null;};

    mkPkgs = system: {
      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    };

    commonModules = system: [
      (
        if system == "aarch64-darwin" || system == "x86_64-darwin"
        then ./configuration/optimise/darwin.nix
        else ./configuration/optimise/linux.nix
      )
      (
        if system == "aarch64-darwin" || system == "x86_64-darwin"
        then ./configuration/garbage-collector/darwin.nix
        else ./configuration/garbage-collector/linux.nix
      )
      (
        if system == "aarch64-darwin" || system == "x86_64-darwin"
        then ./configuration/nixpkgs/darwin.nix
        else ./configuration/nixpkgs/linux.nix
      )
    ];
  in {
    darwinConfigurations.work-laptop = inputs.nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = mkPkgs "aarch64-darwin" // {inherit inputs;};
      modules =
        [
          ./hosts/work-laptop/configuration.nix
          gitHash
          inputs.mac-app-util.darwinModules.default
        ]
        ++ commonModules "aarch64-darwin"
        ++ [
          inputs.home-manager.darwinModules.home-manager
          {
            users.users.jay.home = "/Users/jay";
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = mkPkgs "aarch64-darwin" // {inherit inputs;};
              sharedModules = [
                inputs.sops-nix.homeManagerModules.sops
                inputs.nvf.homeManagerModules.default
              ];
              users.jay.imports = [
                inputs.mac-app-util.homeManagerModules.default
                ./hosts/work-laptop/home.nix
                inputs.one-password-shell-plugins.hmModules.default
              ];
            };
          }
        ];
    };

    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = mkPkgs "x86_64-linux" // {inherit inputs;};
      modules =
        [
          ./hosts/server/configuration.nix
        ]
        ++ commonModules "x86_64-linux"
        ++ [
          inputs.home-manager.nixosModules.home-manager
          {
            users.users.jay.home = "/home/jay";
            home-manager = {
              useUserPackages = true;
              backupFileExtension = "bkp";
              extraSpecialArgs = mkPkgs "x86_64-linux" // {inherit inputs;};
              sharedModules = [
                inputs.sops-nix.homeManagerModules.sops
                inputs.nvf.homeManagerModules.default
                inputs.catppuccin.homeManagerModules.catppuccin
              ];
              users.jay.imports = [./hosts/server/home.nix];
            };
          }
        ];
    };

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = mkPkgs "x86_64-linux" // {inherit inputs;};
      modules =
        [
          ./hosts/laptop/configuration.nix
          inputs.nixos-hardware.nixosModules.framework-12th-gen-intel
        ]
        ++ commonModules "x86_64-linux"
        ++ [
          inputs.home-manager.nixosModules.home-manager
          {
            users.users.jay.home = "/home/jay";
            home-manager = {
              useUserPackages = true;
              backupFileExtension = "bkp";
              extraSpecialArgs = mkPkgs "x86_64-linux" // {inherit inputs;};
              sharedModules = [
                inputs.sops-nix.homeManagerModules.sops
                inputs.nvf.homeManagerModules.default
                inputs.stylix.homeManagerModules.stylix
                inputs.catppuccin.homeManagerModules.catppuccin
              ];
              users.jay.imports = [
                ./hosts/laptop/home.nix
                inputs.one-password-shell-plugins.hmModules.default
              ];
            };
          }
        ];
    };
  };
}
