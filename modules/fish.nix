{ pkgs, ... }:
{
  home.packages = with pkgs.fishPlugins; [
    autopair
    colored-man-pages
    done
    hydro
    puffer
    sponge
    transient-fish
  ];
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
      n = "nvim $argv";
      l = "lsd -a $argv";
      nrd = "sudo clear; cat ~/.local/splashes/systemRebuild; sudo nixos-rebuild switch --flake ~/.dotfiles/#desktop";
      nrl = "sudo clear; cat ~/.local/splashes/systemRebuild; sudo nixos-rebuild switch --flake ~/.dotfiles/#laptop";
      hrd = "clear; cat ~/.local/splashes/homeRebuild; home-manager switch --flake ~/.dotfiles/#fionnbennett-desktop";
      hrl = "clear; cat ~/.local/splashes/homeRebuild; home-manager switch --flake ~/.dotfiles/#fionnbennett-laptop";
      frd = "sudo clear; cat ~/.local/splashes/fullRebuild; nix flake update --flake ~/.dotfiles; sudo nixos-rebuild switch --flake ~/.dotfiles/#desktop; home-manager switch --flake ~/.dotfiles/#fionnbennett-desktop"; # ~/.dotfiles/scripts/zen-browser-themer";
      frl = "sudo clear; cat ~/.local/splashes/fullRebuild; nix flake update --flake ~/.dotfiles; sudo nixos-rebuild switch --flake ~/.dotfiles/#laptop; home-manager switch --flake ~/.dotfiles/#fionnbennett-laptop"; # ~/.dotfiles/scripts/zen-browser-themer";
      mkdir = {
        description = "changes to newly created directory";
        body = # fish
          ''
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
      nix-template = "nix flake init -t github:nix-community/templates#$argv";
      fetch = "fish";
      fbg = "bash -c $argv";
    };
  };
}
