{
  pkgs,
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
      c = "clear";
      n = "nvim $argv";
      z = "zeditor $argv; exit";
      nr = "sudo cp /etc/nixos/hardware-configuration.nix ~/.dotfiles/system/;sudo nixos-rebuild switch --flake ~/.dotfiles";
      hr = "home-manager switch --flake ~/.dotfiles;hyprctl reload;";
      fr = "sudo cp /etc/nixos/hardware-configuration.nix ~/.dotfiles/system/;sudo nix flake update --flake ~/.dotfiles; sudo nixos-rebuild switch --flake ~/.dotfiles; home-manager switch --flake ~/.dotfiles;";
      nix-clean = "sudo nix-collect-garbage --delete-older-than 7d; nix-store --gc; nix-channel --update; nix-env --delete-generations old; nix-env -u --always --verbose";
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
      gc = "git add *; git commit -m $argv; git push github main";
    };
  };
}
