{
  home.file.".thunderbird/extensions/"
  programs.thunderbird = {
    enable = true;
    profiles."default" = {
      settings.extensions.autoDisableScopes = 0;
      extensions = [
      ];
    };
  };
}
