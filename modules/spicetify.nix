{ spicetify-nix, spicePkgs, nur, pkgs, pkgs-unstable, ... }:

{
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      shuffle
      fullAppDisplay
      powerBar
      goToSong
      history
      betterGenres
      playNext
      volumePercentage
      beautifulLyrics
    ];
  };
}
