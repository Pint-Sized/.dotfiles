{pkgs, ...}: {
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
      nrd = "nh os switch ~/.dotfiles -H desktop";
      nrl = "nh os switch ~/.dotfiles -H laptop";
      hrd = "nh home switch ~/.dotfiles -c fionnbennett-desktop;hyprctl reload";
      hrl = "nh home switch ~/.dotfiles -c fionnbennett-laptop;hyprctl reload";
      frd = "nh os switch ~/.dotfiles -H desktop -u; nh home switch ~/.dotfiles -c fionnbennett-desktop; hyprctl reload";
      frl = "nh os switch ~/.dotfiles -H laptop -u; nh home switch ~/.dotfiles -c fionnbennett-laptop; hyprctl reload";
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
      gc = "git add *;git commit -m $argv; git push github main";
      nix-template = "nix flake init -t github:nix-community/templates#$argv";
      fetch = "fish";
      fbg = "bash -c $argv";
    };
  };
}
