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
  };

  outputs = inputs@{ self,    home-manager, nixvim, nix-darwin, nixpkgs }: {
    darwinConfigurations.work-laptop = nix-darwin.lib.darwinSystem {
system = "aarch64-darwin";     
 modules = [ ./configuration.nix 

        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
            sharedModules = [nixvim.homeManagerModules.nixvim];
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