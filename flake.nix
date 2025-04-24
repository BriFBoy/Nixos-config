{
  description = "My first flake";

  inputs = {


    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";


  };
  
  outputs = {self, nixpkgs, home-manager, ...}@inputs:
    let
      UserInfo = {
        username = "brian";
      };
      SystemInfo = {
        hostname = "BrianNixos";
        system = "x86_64-linux";
      };


      lib = nixpkgs.lib;
      
      pkgs = nixpkgs.legacyPackages.${SystemInfo.system};
    in {
    nixosConfigurations = {
      ${SystemInfo.hostname} = lib.nixosSystem {
        
        specialArgs = { 
          inherit inputs;
          inherit SystemInfo;
          inherit UserInfo;
        };
        modules = [ 
          ./system/configuration.nix];
      };
    };
    homeConfigurations = {
      ${UserInfo.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./homemanager/home.nix ];
      };
      
    };
  };
}