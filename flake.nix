{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:/nixos/nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland?ref=v0.48.1";
    };

    nixvim = {
      url = "github:nix-community/nixvim/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
    };

    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
    };

    pyprland = {
      url = "github:hyprland-community/pyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nixpkgs-unstable,
      nixpkgs-master,
      nixvim,
      nix-flatpak,
      stylix,
      spicetify-nix,
      nixcord,
      hyprland,
      hyprland-plugins,
      hypr-dynamic-cursors,
      pyprland,
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
      spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
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
          ];
          specialArgs = {
            inherit inputs;
            inherit pkgs-unstable;
            inherit pkgs-master;
            inherit systemSettings;
            inherit userSettings;
            inherit hyprland;
            inherit hyprland-plugins;
            inherit hypr-dynamic-cursors;
            inherit pyprland;
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
          ];
          specialArgs = {
            inherit inputs;
            inherit pkgs-unstable;
            inherit pkgs-master;
            inherit systemSettings;
            inherit userSettings;
            inherit hyprland;
            inherit hyprland-plugins;
            inherit hypr-dynamic-cursors;
            inherit pyprland;
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
            inherit spicePkgs;
            inherit inputs;
            inherit pkgs-unstable;
            inherit pkgs-master;
            inherit systemSettings;
            inherit userSettings;
            inherit hyprland;
            inherit hyprland-plugins;
            inherit hypr-dynamic-cursors;
          };
        };
      };
    };
}
