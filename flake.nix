{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
    let
      systemSettings = {
        system = "x86_64-linux";
        hostname = "backup";
        timezone = "Europe/Berlin";
        locale = "de_DE.utf-8";
      };
      userSettings = rec {
	      username = "onehinny";
        name = onehinny";
      };
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${systemSettings.system};
    in {
      nixosConfigurations = {
        backup = lib.nixosSystem {
          modules = [ 
            ./hosts/backup/configuration.nix 
          ];
          specialArgs = {
            # pass config variables from above
            inherit systemSettings;
            inherit userSettings;
          };
        };
      };
      homeConfigurations = {
        backup = home-manager.lib.homeManagerConfiguration {
	        inherit pkgs;
          modules = [ 
            ./hosts/backup/home.nix 
          ];
          extraSpecialArgs = {
            inherit userSettings;          
          };
        };
      };
    };
}
