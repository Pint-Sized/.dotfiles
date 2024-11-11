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
    plugins = [
      {
        name = "done";
        src = pkgs.fishPlugins.done;
      }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair;
      }
      {
        name = "puffer";
        src = pkgs.fishPlugins.puffer;
      }
    ];
    functions = {
      fish_greeting = "pokeget nidoran-m --hide-name | fastfetch --file-raw -";
      c = "clear";
      n = "nvim $argv";
      z = "zeditor $argv; exit";
      nr = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      hr = "home-manager switch --flake ~/.dotfiles";
      fr = "nix flake update --flake ~/.dotfiles; home-manager switch --flake ~/.dotfiles; sudo nixos-rebuild switch --flake ~/.dotfiles";
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
