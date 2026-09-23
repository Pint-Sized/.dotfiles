{ pkgs, ... }: # Receive the package set and ignore all other module arguments.
{
  programs.nixvim.plugins.copilot-lua = { # Configure the copilot.lua plugin through Nixvim.
    enable = true; # Install and enable copilot.lua.
    package = pkgs.vimPlugins.copilot-lua.overrideAttrs (_: { # Reuse the packaged plugin while replacing its source attributes.
      src = pkgs.fetchFromGitHub { # Fetch the plugin source directly from GitHub.
        owner = "zbirenbaum"; # Set the GitHub repository owner.
        repo = "copilot.lua"; # Set the GitHub repository name.
        tag = "v2.0.4"; # Pin the source to the copilot.lua v2.0.4 tag.
        hash = "sha256-05f76OeWBlFmlUh90tH4XMMKfNI1jnhuIJDqYPPQokA="; # Verify the downloaded source with its fixed-output SHA-256 hash.
      }; # Finish the GitHub source definition.
    }); # Finish the package override and use it for copilot.lua.
    settings = { # Set copilot.lua's runtime Lua configuration options.
      suggestion = { # Configure Copilot inline suggestions.
        enabled = true; # Enable inline suggestions.
        auto_trigger = true; # Request suggestions automatically while editing.
        hide_during_completion = true; # Hide Copilot suggestions while the completion menu is open.
      }; # Finish the inline suggestion settings.
      panel.enabled = false; # Disable Copilot's separate panel interface.
    }; # Finish the copilot.lua settings attribute set.
  }; # Finish the copilot.lua plugin configuration.
} # Finish the Nix module.
