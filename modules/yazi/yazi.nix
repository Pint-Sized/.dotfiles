{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
  xdg.configFile."yazi/yazi.toml".source = ./yazi.toml;
  xdg.configFile."yazi/plugins/exifaudio.yazi".source = ./plugins/exifaudio.yazi;
}
