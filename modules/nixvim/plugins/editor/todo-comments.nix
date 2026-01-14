{config, ...}: {
  programs.nixvim.plugins.todo-comments = {
    enable = true;
    settings.colors = with config.lib.stylix.colors; {
      error = [
        "DiagnosticError"
        "ErrorMsg"
        "#${base0E-hex}"
      ];
      warning = [
        "DiagnosticWarn"
        "WarningMsg"
        "#${base0A-hex}"
      ];
      info = [
        "DiagnosticInfo"
        "#${base0A-hex}"
      ];
      default = [
        "Identifier"
        "#${base09-hex}"
      ];
      test = [
        "Identifier"
        "#${base0B-hex}"
      ];
    };
  };
}
