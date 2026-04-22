{ inputs, pkgs, ... }:
{
  programs.spicetify = {
    enable = true;
    enabledExtensions =
      with inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system}.extensions; [
        adblock
        shuffle
      ];
  };
}
