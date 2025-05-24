{lib, ...}: let
  inherit (lib.generators) mkLuaInline;
in {
  imports = [
    ./bash.nix
    ./css.nix
    ./lua.nix
    ./markdown.nix
    ./nix.nix
    ./nix.nix
    ./python.nix
    ./sql.nix
    ./terraform.nix
    ./typescript.nix
    ./yaml.nix
  ];

  programs = {
    nvf = {
      settings = {
        vim = {
          lsp = {
            formatOnSave = true;
            enable = true;
            inlayHints.enable = true;
            lightbulb.autocmd.enable = true;
            lspconfig.enable = true;
            trouble.enable = true;
            null-ls = {
              # enable = false;
              setupOpts = {
                sources = [
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.cspell'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.code_actions.cspell'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.code_actions.eslint_d'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.code_actions.gitrebase'')
                  (mkLuaInline
                    ''require("null-ls").builtins.code_actions.refactoring'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.code_actions.shellcheck'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.code_actions.statix'')
                  # (mkLuaInline
                  #   ''require("null-ls").builtins.code_actions.ts_node_action'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.code_actions.xo'')
                  # (mkLuaInline
                  #   ''require("null-ls").builtins.diagnostics.tcs'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.alex'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.commitlint'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.markdownlint_cli2'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.misspell'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.standardjs'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.standardts'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.terraform_validate'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.tidy'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.todo_comments'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.commitlint'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.trail_space'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.tsc'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.typos'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.vacuum'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.write_good'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.xo'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.diagnostics.yamllint'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.formatting.alejandra'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.formatting.autoflake'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.formatting.cbfmt'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.formatting.beautysh'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.formatting.codespell'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.formatting.eslint_d'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.formatting.fixjson'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.formatting.jq'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.formatting.rome'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.formatting.standardjs'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.formatting.standardts'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.formatting.trim_whitespace'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.formatting.yq'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.hover.dictionary'')
                  #     (mkLuaInline
                  #       ''require("null-ls").builtins.hover.printenv'')
                ];
              };
            };
            servers = {
              marksman = {
                enable = true;
                capabilities = {
                  core.title_from_heading = false;
                };
              };
            };
          };
          languages = {
            enableDAP = true;
            enableExtraDiagnostics = true;
            enableFormat = true;
            enableTreesitter = true;
          };
        };
      };
    };
  };
}
