{
  programs.nixvim.extraFiles."queries/nix/injections.scm".text = ''
  ; extends

  ; ---------------------------------------------------------
  ; 1. Configuration Files via Attribute Paths
  ; ---------------------------------------------------------

  ; JSON / JSONC
  (binding
    attrpath: (attrpath (string_expression (string_fragment) @_filename) (#match? @_filename "\\.jsonc?$"))
    expression: [
      (string_expression (string_fragment) @injection.content)
      (indented_string_expression (indented_string_fragment) @injection.content)
    ]
    (#set! injection.language "jsonc")
  )

  ; YAML
  (binding
    attrpath: (attrpath (string_expression (string_fragment) @_filename) (#match? @_filename "\\.ya?ml$"))
    expression: [
      (string_expression (string_fragment) @injection.content)
      (indented_string_expression (indented_string_fragment) @injection.content)
    ]
    (#set! injection.language "yaml")
  )

  ; TOML
  (binding
    attrpath: (attrpath (string_expression (string_fragment) @_filename) (#match? @_filename "\\.toml$"))
    expression: [
      (string_expression (string_fragment) @injection.content)
      (indented_string_expression (indented_string_fragment) @injection.content)
    ]
    (#set! injection.language "toml")
  )

  ; Lua
  (binding
    attrpath: (attrpath (string_expression (string_fragment) @_filename) (#match? @_filename "\\.lua$"))
    expression: [
      (string_expression (string_fragment) @injection.content)
      (indented_string_expression (indented_string_fragment) @injection.content)
    ]
    (#set! injection.language "lua")
  )

  ; Bash / Shell Scripts
  (binding
    attrpath: (attrpath (string_expression (string_fragment) @_filename) (#match? @_filename "\\.(sh|bash)$"))
    expression: [
      (string_expression (string_fragment) @injection.content)
      (indented_string_expression (indented_string_fragment) @injection.content)
    ]
    (#set! injection.language "bash")
  )

  ; ---------------------------------------------------------
  ; 2. Common NixOS / Home Manager Options
  ; ---------------------------------------------------------

  ; Lua Configurations (e.g., extraConfigLua, extraLuaConfig)
  (binding
    attrpath: (attrpath (identifier) @_attr)
    (#match? @_attr "^(extraConfigLua|luaConfig|extraLuaConfig)$")
    expression: [
      (string_expression (string_fragment) @injection.content)
      (indented_string_expression (indented_string_fragment) @injection.content)
    ]
    (#set! injection.language "lua")
  )

  ; Bash Hooks and Init Scripts (e.g., shellHook, initExtra)
  (binding
    attrpath: (attrpath (identifier) @_attr)
    (#match? @_attr "^(initExtra|profileExtra|extraInit|shellHook|preHook|postHook)$")
    expression: [
      (string_expression (string_fragment) @injection.content)
      (indented_string_expression (indented_string_fragment) @injection.content)
    ]
    (#set! injection.language "bash")
  )

  ; ---------------------------------------------------------
  ; 3. Nixpkgs Builders (writeShellScript, writeScriptBin)
  ; ---------------------------------------------------------

  (apply_expression
    function: (apply_expression
      function: (identifier) @_func
      (#match? @_func "^write(Shell)?Script(Bin)?$")
    )
    argument: [
      (string_expression (string_fragment) @injection.content)
      (indented_string_expression (indented_string_fragment) @injection.content)
    ]
    (#set! injection.language "bash")
  )
'';
}
