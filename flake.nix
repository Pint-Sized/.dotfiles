{

  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR/2b457ac396f54d0e184f658d852080a6bb6ce80b";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      catppuccin,
      nur,
      nixpkgs-unstable,
      nixvim,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in {
      nixosConfigurations = {
        sisyphus = lib.nixosSystem {
          inherit system;
          modules = [
            ./system/configuration.nix
            catppuccin.nixosModules.catppuccin
            nixvim.nixosModules.nixvim
            nur.nixosModules.nur
            ({config, ...}: { 
            environment.systemPackages = [config.nur.repos.nltch.spotify-adblock];
            })
          ];
          specialArgs = {
            inherit pkgs-unstable;
          };
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
