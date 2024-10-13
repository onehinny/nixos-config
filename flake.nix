{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs, ...}: 
    let
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
      backup = lib.nixosSystem {
        system = "x64_64-linux"
        modules = [./configuration.nix] ;
      }
    };
  };
}
