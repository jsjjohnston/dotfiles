{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.nixvim = {
    extraConfigLuaPre = ''
      vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticError", linehl = "", numhl = "" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
      vim.fn.sign_define("DiagnosticSignHint", { text = " 󰌵", texthl = "DiagnosticHint", linehl = "", numhl = "" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticInfo", linehl = "", numhl = "" })

      local function preview_location_callback(_, result)
        if result == nil or vim.tbl_isempty(result) then
          vim.notify('No location found to preview')
          return nil
        end
      local buf, _ = vim.lsp.util.preview_location(result[1])
        if buf then
          local cur_buf = vim.api.nvim_get_current_buf()
          vim.bo[buf].filetype = vim.bo[cur_buf].filetype
        end
      end

      function peek_definition()
        local params = vim.lsp.util.make_position_params()
        return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
      end

      local function peek_type_definition()
        local params = vim.lsp.util.make_position_params()
        return vim.lsp.buf_request(0, 'textDocument/typeDefinition', params, preview_location_callback)
      end

      require('lspconfig.ui.windows').default_options = {
        border = "rounded"
      }
    '';

    autoCmd = [
      (lib.mkIf config.programs.nixvim.plugins.lsp.servers.helm_ls.enable {
        event = "FileType";
        pattern = "helm";
        command = "LspRestart";
      })
    ];
  };
  programs.nixvim.plugins = {
    helm.enable = true;
    lspkind.enable = true;
    lsp-lines.enable = true;
    lsp-format.enable = lib.mkIf (!config.programs.nixvim.plugins.conform-nvim.enable) true;
    lsp-signature.enable = true;

    lsp = {
      enable = true;

      keymaps = {
        silent = true;
        diagnostic = {
          # Navigate in diagnostics
          "[d" = {
            action = "goto_prev";
            desc = "Go to previous [D]iagnostic message";
          };
          "]d" = {
            #mode = "n";
            action = "goto_next";
            desc = "Go to next [D]iagnostic message";
          };
          "<leader>e" = {
            #mode = "n";
            action = "open_float";
            desc = "Show diagnostic [E]rror messages";
          };
          "<leader>q" = {
            #mode = "n";
            action = "setloclist";
            desc = "Open diagnostic [Q]uickfix list";
          };
        };

        extra = [
          {
            mode = "n";
            key = "gd";
            action.__raw = "require('telescope.builtin').lsp_definitions";
            options = {
              desc = "LSP: [G]oto [D]efinition";
            };
          }
          # Find references for the word under your cursor.
          {
            mode = "n";
            key = "gr";
            action.__raw = "require('telescope.builtin').lsp_references";
            options = {
              desc = "LSP: [G]oto [R]eferences";
            };
          }
          # Jump to the implementation of the word under your cursor.
          #  Useful when your language has ways of declaring types without an actual implementation.
          {
            mode = "n";
            key = "gI";
            action.__raw = "require('telescope.builtin').lsp_implementations";
            options = {
              desc = "LSP: [G]oto [I]mplementation";
            };
          }
          # Jump to the type of the word under your cursor.
          #  Useful when you're not sure what type a variable is and you want to see
          #  the definition of its *type*, not where it was *defined*.
          {
            mode = "n";
            key = "<leader>D";
            action.__raw = "require('telescope.builtin').lsp_type_definitions";
            options = {
              desc = "LSP: Type [D]efinition";
            };
          }
          # Fuzzy find all the symbols in your current document.
          #  Symbols are things like variables, functions, types, etc.
          {
            mode = "n";
            key = "<leader>ds";
            action.__raw = "require('telescope.builtin').lsp_document_symbols";
            options = {
              desc = "LSP: [D]ocument [S]ymbols";
            };
          }
          {
            action.__raw = ''
              function()
                vim.lsp.buf.format({
                  async = true,
                  range = {
                    ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
                    ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
                  }
                })
              end
            '';
            mode = "v";
            key = "<leader>fs";
            options = {
              desc = "Format [S]election";
            };
          }
          {
            action.__raw = "peek_definition";
            mode = "n";
            key = "<leader>pd";
            options = {
              desc = "Peek [D]efinition";
            };
          }
          {
            action.__raw = "peek_type_definition";
            mode = "n";
            key = "<leader>ptd";
            options = {
              desc = "[P]eek [T]ype [D]efinition";
            };
          }
        ];

        lspBuf = {
          "<leader>ca" = {
            action = "code_action";
            desc = "Code [A]ction";
          };
          "K" = {
            action = "hover";
            desc = "LSP: Hover Documentation";
          };
          "<leader>li" = "implementation";
          "<leader>rn" = {
            action = "rename";
            desc = "LSP: [R]e[n]ame";
          };
          "gD" = {
            action = "declaration";
            desc = "LSP: [G]oto [D]eclaration";
          };
        };
      };

      servers = {
        bashls = {
          enable = true;

          filetypes = [
            "sh"
            "bash"
          ];
        };

        # TODO: see what further configuration might be needed
        cmake = {
          enable = true;
          filetypes = [ "cmake" ];
        };

        dockerls = {
          enable = true;
          filetypes = [ "dockerfile" ];
        };

        # FIX: fix exlint errors /nix/store/xwz3xij6krvkckv3ywmys7vc3zjzas7k-vscode-langservers-extracted-4.10.0/bin/vscode-eslint-language-server -v 
        eslint = {
          enable = true;
          filetypes = [
            "javascript"
            "javascriptreact"
            "typescript"
            "typescriptreact"
          ];
        };

        html = {
          enable = true;
          filetypes = [ "html" ];
        };

        lua_ls = {
          enable = true;
          filetypes = [ "lua" ];
        };

        marksman = {
          enable = true;
          filetypes = [ "markdown" ];
        };

        nil_ls = {
          # FIXME: when nixd works again
          # enable = !config.plugins.lsp.servers.nixd.enable;
          enable = true;
          filetypes = [ "nix" ];
          settings = {
            formatting = {
              command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
            };
            nix = {
              flake = {
                autoArchive = true;
              };
            };
          };
        };

        nixd = {
          enable = !config.programs.nixvim.plugins.lsp.servers.nil_ls.enable;
          filetypes = [ "nix" ];
          settings = {
            formatting = {
              command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
            };
          };
        };

        rust_analyzer = {
          enable = !config.programs.nixvim.plugins.rustaceanvim.enable;
          filetypes = [ "rust" ];
          installCargo = true;
          installRustc = true;

          settings = {
            diagnostics = {
              enable = true;
              # experimental.enable = true;
              styleLints.enable = true;
            };

            files = {
              excludeDirs = [
                ".direnv"
                "rust/.direnv"
              ];
            };

            inlayHints = {
              bindingModeHints.enable = true;
              closureStyle = "rust_analyzer";
              closureReturnTypeHints.enable = "always";
              discriminantHints.enable = "always";
              expressionAdjustmentHints.enable = "always";
              implicitDrops.enable = true;
              lifetimeElisionHints.enable = "always";
              rangeExclusiveHints.enable = true;
            };

            procMacro = {
              enable = true;
            };
          };
        };

        sqls = {
          enable = true;
          filetypes = [ "sql" ];
        };

        ts_ls = {
          enable = !config.programs.nixvim.plugins.typescript-tools.enable;
          filetypes = [
            "javascript"
            "javascriptreact"
            "typescript"
            "typescriptreact"
          ];
        };

        yamlls = {
          enable = true;
          filetypes = [ "yaml" ];
        };
      };
    };
  };
}
