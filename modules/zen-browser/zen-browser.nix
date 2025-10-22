{
  imports = [
    ./userChrome.nix
    ./userContent.nix
  ];
  programs.zen-browser = {
    enable = true;
    profiles."default" = {};
  };
}
