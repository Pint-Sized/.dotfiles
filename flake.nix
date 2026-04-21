{
  inputs = {
    # ----- NIX PACKAGES ----- #
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    # ----- NIXOS-HARDWARE ----- #
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # ----- NIX-USER-REPOSITORY ----- #
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- HOME-MANAGER ----- #
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- NIX-INDEX ----- #
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- STYLIX ----- #
    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- NIXVIM ----- #
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ------ NIX-FLATPAKS ----- #
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";

    # ----- SPICETIFY ------ #
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- NIXCORD ----- #
    nixcord = {
      url = "github:kaylorben/nixcord/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nixpkgs-unstable,
      nixpkgs-master,
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
        fontPkg = "nerd-fonts.caskaydia-cove";
        fontSerif = "CaskaydiaCove NF";
        fontMono = "CaskaydiaCove NF";
        cursorPkg = "pkgs.bibata-cursors";
        cursorName = "Bibata-Modern-Classic";
      };

      sharedConfig = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-33.4.11"
          "python-2.7.18.8"
          "dotnet-runtime-7.0.20"
          "dotnet-runtime-wrapped-7.0.20"
          "mbedtls-2.28.10"
        ];
      };

      mkPkgs =
        source:
        import source {
          inherit (systemSettings) system;
          config = sharedConfig;
        };

      pkgs = mkPkgs nixpkgs;
      pkgs-unstable = mkPkgs nixpkgs-unstable;
      pkgs-master = mkPkgs nixpkgs-master;

      mkSystem =
        hostModule: extraModules:
        nixpkgs.lib.nixosSystem {
          inherit (systemSettings) system;
          modules = [
            ./configuration.nix
            hostModule
            inputs.nixvim.nixosModules.nixvim
            inputs.stylix.nixosModules.stylix
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.nix-index-database.nixosModules.nix-index
            { nixpkgs.config = sharedConfig; }
          ]
          ++ extraModules;
          specialArgs = {
            inherit
              inputs
              pkgs-unstable
              pkgs-master
              systemSettings
              userSettings
              ;
          };
        };

      # --- Home Manager Helper --- #
      mkHome =
        varFile:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
            varFile
            inputs.nixvim.homeModules.nixvim
            inputs.stylix.homeModules.stylix
            inputs.spicetify-nix.homeManagerModules.default
            inputs.nixcord.homeModules.nixcord
          ];
          extraSpecialArgs = {
            inherit
              inputs
              pkgs-unstable
              pkgs-master
              systemSettings
              userSettings
              ;
          };
        };
    in
    {
      nixosConfigurations = {
        desktop = mkSystem ./hosts/desktop/configuration.nix [ ];
        laptop = mkSystem ./hosts/laptop/configuration.nix [
          inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
        ];
      };

      homeConfigurations = {
        fionnbennett-desktop = mkHome ./modules/hyprland/variables-desktop.nix;
        fionnbennett-laptop = mkHome ./modules/hyprland/variables-laptop.nix;
      };
    };
}
