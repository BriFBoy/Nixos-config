{
  description = "My first flake";

  inputs = {

    zen-browser.url = "github:MarceColl/zen-browser-flake";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";


  };
  
  outputs = {self, nixpkgs, home-manager, ...}@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      BrianNixos = lib.nixosSystem {
        
        specialArgs = { 
          inherit inputs;
          inherit system;
        };
        modules = [ 
          ./system/configuration.nix];
      };
    };
    homeConfigurations = {
      brian = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./homemanager/home.nix ];
      };
      
    };
  };
}