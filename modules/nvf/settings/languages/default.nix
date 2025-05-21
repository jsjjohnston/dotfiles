{pkgs, ...}: {
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
            formatOnSave = false;
            enable = true;
            inlayHints.enable = true;
            lightbulb.enable = true;
            lightbulb.autocmd.enable = true;
            lspconfig.enable = true;
            # lspkind.enable = true;
            lspsaga.enable = false;
            # nvim-docs-view.enable = true;
            trouble.enable = true;
            servers = {
              # ts_ls = {
              #   enable = true;
              #   autostart = true;
              #
              #   cmd = [
              #     "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server"
              #     "--stdio"
              #   ];
              #
              #   filetypes = [
              #     "javascript"
              #     "javascriptreact"
              #     "javascript.jsx"
              #     "typescript"
              #     "typescriptreact"
              #     "typescript.tsx"
              #   ];
              #   root_markers = ["package.json" "tsconfig.json" ".git"];
              # };
              vtsls = {
                enable = false;
                cmd = ["${pkgs.vtsls}/bin/vtsls" "--stdio"];
                filetypes = [
                  "javascript"
                  "javascriptreact"
                  "javascript.jsx"
                  "typescript"
                  "typescriptreact"
                  "typescript.tsx"
                ];
                settings = {
                  complete_function_calls = true;
                  vtsls = {
                    enableMoveToFileCodeAction = true;
                    autoUseWorkspaceTsdk = true;
                    experimental = {
                      maxInlayHintLength = 30;
                      completion = {
                        enableServerSideFuzzyMatch = true;
                      };
                    };
                  };
                  typescript = {
                    updateImportsOnFileMove = {enabled = "always";};
                    suggest = {
                      completeFunctionCalls = true;
                    };
                    referencesCodeLens = {
                      enabled = true;
                      showOnAllFunctions = true;
                    };
                    implementationsCodeLens = {
                      enabled = true;
                      showOnInterfaceMethods = true;
                    };
                    workspaceSymbols = {
                      scope = "currentProject";
                      excludeLibrarySymbols = false;
                    };
                    suggest = {
                      enabled = true;
                      autoImports = true;
                      names = true;
                      paths = true;
                      completeJSDocs = true;
                      jsdoc.generateReturns = true;
                      includeAutomaticOptionalChainCompletions = true;
                      includeCompletionsForImportStatements = true;
                      classMemberSnippets = {enabled = true;};
                      objectLiteralMethodSnippets = {enabled = true;};
                    };
                    preferGoToSourceDefinition = true;
                    inlayHints = {
                      enumMemberValues = {enabled = true;};
                      parameterNames = {enabled = "literals";};
                      parameterTypes = {enabled = true;};
                      propertyDeclarationTypes = {enabled = true;};
                      variableTypes = {enabled = true;};
                      functionLikeReturnTypes = {enabled = true;};
                    };
                    preferences = {
                      useAliasesForRenames = false;
                      organizeImports = "auto";
                    };
                    format.semicolons = "insert";
                    tsserver = {
                      web = {
                        projectWideIntellisense.enabled = true;
                        projectWideIntellisense.suppressSemanticErrors = false;
                        typeAcquisition.enabled = true;
                      };
                      useSyntaxServer = "always";
                      experimental.enableProjectDiagnostics = true;
                    };
                  };
                };
              };
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
