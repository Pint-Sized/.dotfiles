{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    nixvim = {
      url = "github:nix-community/nixvim/main";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #firefox-gnome-theme = {
    #url = "github:rafaelmardojai/firefox-gnome-theme";
    #flake = false;
    #};
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      catppuccin,
      nixpkgs-unstable,
      nixvim,
      nix-flatpak,
      stylix,
      spicetify-nix,
      #firefox-gnome-theme,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      nixosConfigurations = {
        sisyphus = lib.nixosSystem {
          inherit system;
          modules = [
            ./system/configuration.nix
            catppuccin.nixosModules.catppuccin
            nixvim.nixosModules.nixvim
            stylix.nixosModules.stylix
            nix-flatpak.nixosModules.nix-flatpak
          ];
          specialArgs = { inherit pkgs-unstable; };
        };
      };
      homeConfigurations = {
        fionnbennett = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
            catppuccin.homeManagerModules.catppuccin
            nixvim.homeManagerModules.nixvim
            stylix.homeManagerModules.stylix
            spicetify-nix.homeManagerModules.default
          ];
          extraSpecialArgs = {
            inherit spicePkgs;
            inherit pkgs-unstable;
            #inherit firefox-gnome-theme;
          };
        };
      };
    };

}
