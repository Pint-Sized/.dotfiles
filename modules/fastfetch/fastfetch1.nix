{ config, ... }:

{
  programs.fastfetch = with config.lib.stylix.colors; {
    enable = true;
    settings = {
      logo = {
        type = "none";
        padding.top = 2;
      };
      display = {
        disableLinewrap = false;
        separator = "";
        key.width = 25;
        constants = [
          "\u001b[48;2;43;43;69m"
          "\u001b[48;2;56;59;78m"
          "\u001b[90m│                                                            │\u001b[60D\u001b[39m"
        ];
      };
      modules = [
        "break"
        {
          type = "custom";
          key = " ╭──────────────╮";
          format = "╭────────────────────────────────────────────────────────────╮";
        }
        {
          key = " {#90}{$1}│ {#93}OS           {#90}│";
          type = "os";
          #keyColor = "38;2;${base0E-rgb-r};${base0E-rgb-g};${base0E-rgb-b}";
        }
        {
          key = " │ Kernel        │";
          type = "kernel";
          keyColor = "38;2;${base0B-rgb-r};${base0B-rgb-g};${base0B-rgb-b}";
        }
        {
          key = " │ WM           │";
          type = "wm";
          keyColor = "38;2;${base08-rgb-r};${base08-rgb-g};${base08-rgb-b}";
        }
        {
          key = " │ Shell        │";
          type = "shell";
          keyColor = "38;2;${base07-rgb-r};${base07-rgb-g};${base07-rgb-b}";
        }
        {
          key = " │ CPU          │";
          type = "cpu";
          keyColor = "38;2;${base0E-rgb-r};${base0E-rgb-g};${base0E-rgb-b}";
        }
        {
          key = " │ GPU          │";
          type = "gpu";
          keyColor = "38;2;${base0B-rgb-r};${base0B-rgb-g};${base0B-rgb-b}";
        }
        {
          key = " │ Memory       │";
          type = "memory";
          keyColor = "38;2;${base08-rgb-r};${base08-rgb-g};${base08-rgb-b}";
        }
        {
          key = " │ Color Scheme │";
          type = "command";
          text = "~/.config/fastfetch/theme";
          keyColor = "38;2;${base07-rgb-r};${base07-rgb-g};${base07-rgb-b}";
        }
        {
          key = " │ Battery      │";
          type = "battery";
          keyColor = "38;2;${base0E-rgb-r};${base0E-rgb-g};${base0E-rgb-b}";
        }
      ];
    };
  };
}
