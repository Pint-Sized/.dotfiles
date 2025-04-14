{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "small";
      };
      display = {
        separator = "";
        color = "cyan";
      };
      modules = [
        "break"
        {
          key = "os     ";
          type = "os";
        }
        {
          key = "ker    ";
          type = "kernel";
        }
        {
          key = "wm     ";
          type = "wm";
        }
        {
          key = "sh     ";
          type = "shell";
        }
        {
          key = "cpu    ";
          type = "cpu";
        }
        {
          key = "gpu    ";
          type = "gpu";
        }
        {
          key = "ram    ";
          type = "memory";
        }
        {
          key = "theme  ";
          type = "command";
          text = "~/.config/fastfetch/theme";
        }
        {
          key = "bat    ";
          type = "battery";
        }

        "break"
        {
          type = "colors";
          paddingLeft = 6;
          symbol = "square";
        }
      ];

    };
  };
}
