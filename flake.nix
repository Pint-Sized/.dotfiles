{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:/nixos/nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager/0b491b460f52e87e23eb17bbf59c6ae64b7664c1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland?ref=v0.48.1";
    };

    nixvim = {
      url = "github:nix-community/nixvim/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    stylix = {
      url = "github:danth/stylix/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    hypr-darkwindow = {
      url = "github:skissue/hyprchroma";
      inputs.hyprland.follows = "hyprland";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprfocus = {
      url = "github:pyt0xic/hyprfocus";
      inputs.hyprland.follows = "hyprland";
    };

    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
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
      hypr-darkwindow,
      hyprland,
      hyprland-plugins,
      hyprfocus,
      hypr-dynamic-cursors,
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
            inherit hypr-darkwindow;
            inherit hyprland;
            inherit hyprland-plugins;
            inherit hyprfocus;
            inherit hypr-dynamic-cursors;
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
            inherit hypr-darkwindow;
            inherit hyprland;
            inherit hyprland-plugins;
            inherit hyprfocus;
            inherit hypr-dynamic-cursors;
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
            nixcord.homeManagerModules.nixcord
          ];
          extraSpecialArgs = {
            inherit spicePkgs;
            inherit inputs;
            inherit pkgs-unstable;
            inherit pkgs-master;
            inherit systemSettings;
            inherit userSettings;
            inherit hypr-darkwindow;
            inherit hyprland;
            inherit hyprland-plugins;
            inherit hyprfocus;
            inherit hypr-dynamic-cursors;
          };
        };
      };
    };
}
