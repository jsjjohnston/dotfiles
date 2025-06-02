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
    # vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, {buffer=bufnr, noremap=true, silent=true, desc='Code action'})

    nvf = {
      settings = {
        vim = {
          keymaps = [
            {
              key = "<leader>la";
              mode = "v";
              silent = true;
              action = "vim.lsp.buf.code_action";
              desc = "Code acation";
              lua = true;
            }
          ];
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
                  (mkLuaInline
                    ''require("null-ls").builtins.code_actions.gitrebase'')
                  (mkLuaInline
                    ''require("null-ls").builtins.code_actions.gitsigns'')

                  (mkLuaInline
                    ''require("null-ls").builtins.code_actions.proselint'')
                  (mkLuaInline
                    ''require("null-ls").builtins.code_actions.refactoring'')
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
