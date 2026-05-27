{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nur = {
      url = "github:the-pint-sized-powerhouse/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
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
        theme = "spaceduck";
        fontSerif = "RecMonoCasual Nerd Font";
        fontMono = "RecMonoCasual Nerd Font Mono";
        fontPropo = "RecMonoCasual Nerd Font Propo";
        fontItalic = "RecMonoCasual Nerd Font";
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
            ./system/configuration.nix
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
      mkHome =
        varFile:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./modules/home.nix
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
        desktop = mkSystem ./system/hosts/desktop/configuration.nix [ ];
        laptop = mkSystem ./system/hosts/laptop/configuration.nix [
          inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
        ];
      };
      homeConfigurations = {
        fionnbennett-desktop = mkHome ./modules/hypr/variables-desktop.nix;
        fionnbennett-laptop = mkHome ./modules/hypr/variables-laptop.nix;
      };
    };
}
