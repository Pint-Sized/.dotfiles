{
  programs.zed-editor = {
    enable = true;

    # Optional: Automatically install common extensions
    extensions = [
      "nix"
      "toml"
      "rust"
    ];

    userSettings = {
      # Enable GitHub Copilot for inline completions
      features = {
        copilot = true;
      };

      # Place the AI Agent panel on the right side
      agent = {
        dock = "right";
      };

      # Place the project panel on the left side
      project_panel = {
        dock = "left";
      };

      # Configure the Assistant panel to use Copilot Chat
      #assistant = {
      #enabled = true;
      #version = "2";
      #default_model = {
      #provider = "copilot_chat";
      #model = "gpt-4o"; # Other options: "gpt-4", "gpt-3.5-turbo", "o1-preview"
      #};
      #};

      # Some optional baseline quality-of-life settings
      telemetry = {
        metrics = false;
      };
      vim_mode = true;
    };
  };
}
