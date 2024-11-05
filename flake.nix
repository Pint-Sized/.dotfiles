{

  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nur.url = "github:nix-community/NUR/2b457ac396f54d0e184f658d852080a6bb6ce80b";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    nixvim.url = "github:nix-community/nixvim";
  };
  
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      catppuccin,
      nur,
      nixvim,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        sisyphus = lib.nixosSystem {
          inherit system;
          modules = [
            ./system/configuration.nix
            catppuccin.nixosModules.catppuccin
            nur.nixosModules.nur
            ({config, ...}: { 
            environment.systemPackages = [config.nur.repos.nltch.spotify-adblock];
            })
          ];
        };
      };
      homeConfigurations = {
        fionnbennett = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
            catppuccin.homeManagerModules.catppuccin
            nixvim.homeManagerModules.nixvim
          ];
        };
      };
    };

}
