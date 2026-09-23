{ ... }: # Accept the module arguments without binding any of them.
{
  programs.nixvim.plugins.avante = { # Configure the Avante plugin through Nixvim.
    enable = true; # Install and enable Avante.
    settings = { # Set Avante's runtime Lua configuration options.
      provider = "copilot"; # Use GitHub Copilot for Avante chat and code actions.
      auto_suggestions_provider = "copilot"; # Use GitHub Copilot for Avante's inline suggestions.
    }; # Finish the Avante settings attribute set.
  }; # Finish the Avante plugin configuration.
} # Finish the Nix module.
