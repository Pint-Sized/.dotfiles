{
  inputs = {
    # ----- NIX PACKAGES ----- #
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:/nixos/nixpkgs/master";

    # ----- NIX-USER-REPOSITORY ----- #
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- HOME-MANAGER ----- #
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- NIX-INDEX ----- #
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- STYLIX ----- #
    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- NIXVIM ----- #
    nixvim = {
      url = "github:nix-community/nixvim/main";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # ------ NIX DECLERATIVE FLATPAKS ----- #
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
    };

    # ----- SPICETIFY ------ #
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- NIXCORD ----- #
    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nixpkgs-unstable,
      nixpkgs-master,
      nix-index-database,
      nixvim,
      nix-flatpak,
      stylix,
      spicetify-nix,
      nixcord,
      ...
    }:
    let
      systemSettings = {
        system = "x86_64-linux";
        hostname = "sisyphus";
        timezone = "Europe/Dublin";
        locale = "en_IE.UTF-8";
      };

      userSettings = {
        username = "fionnbennett";
        name = "Fionn Bennett";
        email = "fionnbennett06@gmail.com";
        theme = "dracula";
        fontPkg = "pkgs.nerdfonts";
        fontSerif = "CaskaydiaCove Nerd Font";
        fontMono = "CaskaydiaCove Nerd Font";
        cursorPkg = "pkgs.bibata-cursors";
        cursorName = "Bibata-Modern-Classic";
      };

      inherit (nixpkgs) lib;

      system = "x86_64-linux";

      pkgs = nixpkgs.legacyPackages.${system};

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            "dotnet-runtime-7.0.20"
            "dotnet-runtime-wrapped-7.0.20"
          ];
        };
      };

      pkgs-master = import nixpkgs-master {
        inherit system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            "dotnet-runtime-7.0.20"
            "dotnet-runtime-wrapped-7.0.20"
          ];
        };
      };
    in
    {
      nixosConfigurations = {
        desktop = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hosts/desktop/configuration.nix
            nixvim.nixosModules.nixvim
            stylix.nixosModules.stylix
            nix-flatpak.nixosModules.nix-flatpak
            nix-index-database.nixosModules.nix-index
          ];
          specialArgs = {
            inherit inputs;
            inherit pkgs-unstable;
            inherit pkgs-master;
            inherit systemSettings;
            inherit userSettings;
          };
        };
        laptop = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hosts/laptop/configuration.nix
            nixvim.nixosModules.nixvim
            stylix.nixosModules.stylix
            nix-flatpak.nixosModules.nix-flatpak
            nix-index-database.nixosModules.nix-index
            { programs.nix-index-database.comma.enable = true; }
          ];
          specialArgs = {
            inherit inputs;
            inherit pkgs-unstable;
            inherit pkgs-master;
            inherit systemSettings;
            inherit userSettings;
          };
        };
      };
      homeConfigurations = {
        fionnbennett = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
            nixvim.homeManagerModules.nixvim
            stylix.homeManagerModules.stylix
            spicetify-nix.homeManagerModules.default
            nixcord.homeModules.nixcord
          ];
          extraSpecialArgs = {
            inherit inputs;
            inherit pkgs-unstable;
            inherit pkgs-master;
            inherit systemSettings;
            inherit userSettings;
          };
        };
      };
    };
}
