{ lib, ... }:
let
  settings = {
    provider = "copilot";
    auto_suggestions_provider = "copilot";
  };
in
{
  programs.nixvim.plugins.avante = {
    enable = true;
    inherit settings;
    # copilot.lua >= 2.x stores its login in auth.db, which avante can't read (it wants hosts.json/apps.json)
    # and throws from setup(), aborting the rest of init.lua. Catch it so the other plugins still load.
    luaConfig.content = lib.mkForce ''
      require("avante_lib").load()
      local ok, err = pcall(require("avante").setup, ${lib.generators.toLua { } settings})
      if not ok then
        vim.schedule(function() vim.notify("avante setup failed: " .. tostring(err), vim.log.levels.WARN) end)
      end
    '';
  };
}
