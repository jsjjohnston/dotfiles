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
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs: 
	let 
		system = "x86_64-linux";
		pkgs = import nixpkgs;
	in
    {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs; inherit nixvim;};
      modules = [
 	       ./hosts/default/configuration.nix
        	 inputs.home-manager.nixosModules.default
	 
	home-manager.nixosModules.home-manager
        {
		home-manager = 
		{
			extraSpecialArgs = {inherit inputs;};
                	sharedModules = [ nixvim.homeManagerModules.nixvim ];
			users = 
			{
				"jay" =	import ./hosts/default/home.nix;
                        };
			backupFileExtension = "backup";
              	};
	}


	];

};
};

}
