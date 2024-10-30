{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  # ------- FISH ------- #
  programs.fish = {
    enable = true;
    functions = {
      fish_greeting = "pokeget nidoran-m --hide-name | fastfetch --file-raw -";
      c = "clear";
      m = "micro $argv";
      z = "zeditor $argv; exit";
      nr = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      hr = "home-manager switch --flake ~/.dotfiles";
      fr = "sudo nix flake update --flake ~/.dotfiles; home-manager switch --flake ~/.dotfiles; sudo nixos-rebuild switch --flake ~/.dotfiles";
	  dotflex = "bat ~/.dotfiles/home.nix ~/.dotfiles/flake.nix ~/.dotfiles/flake.lock ~/.dotfiles/modules/bat/* ~/.dotfiles/modules/btop/* ~/.dotfiles/modules/catppuccin/* ~/.dotfiles/modules/cava/* ~/.dotfiles/modules/fish/* ~/.dotfiles/modules/gtk/* ~/.dotfiles/modules/home-settings/* ~/.dotfiles/modules/hyprland/* ~/.dotfiles/modules/hyprlock/* ~/.dotfiles/modules/kitty/* ~/.dotfiles/modules/micro/* ~/.dotfiles/modules/qt/* ~/.dotfiles/modules/rofi/* ~/.dotfiles/modules/waybar/* ~/.dotfiles/modules/wlogout/* ~/.dotfiles/modules/yazi/* ~/.dotfiles/modules/zathura/*";
      sysflex = "bat ~/.dotfiles/modules/system/configuration.nix ~/.dotfiles/modules/system/hardware-configuration.nix ~/.dotfiles/modules/system/hardware.nix ~/.dotfiles/modules/system/packages.nix ~/.dotfiles/modules/system/services.nix ~/.dotfiles/modules/system/system.nix ~/.dotfiles/modules/system/wifi.nix";
      y = {
        description = "Yazi changes directory on exit";
        body = ''
                    set tmp (mktemp -t "yazi-cwd.XXXXXX")
          	      yazi $argv --cwd-file="$tmp"
          	      if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          			builtin cd -- "$cwd"
          	      end
          	      rm -f -- "$tmp"
        '';
      };
      mkdir = {
        description = "changes to newly created directory";
        body = ''
          command mkdir $argv
              if test $status = 0
                  switch $argv[(count $argv)]
                      case '-*'

                      case '*'
                          cd $argv[(count $argv)]
                          return
                  end
              end
        '';
      };
    };
  };

}
