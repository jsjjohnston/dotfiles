{
  lib,
  pkgs,
  ...
}: {
  programs.nixvim = {
    keymaps = [
      {
        key = "<leader>f";
        action = {__raw = "function() require('conform').format { async = true, lsp_fallback = true } end";};
        options = {desc = "[F]ormat buffer";};
      }
    ];

    plugins = {
      conform-nvim = {
        enable = true;
        settings = {
          formatters = {
            alejandra = {
              command = "${lib.getExe pkgs.alejandra}";
            };
            squeeze_blanks = {
              command = lib.getExe' pkgs.coreutils "cat";
            };
            terraform_fmt = {
              command = lib.getExe pkgs.terraform;
            };
          };
          notify_on_error = false;
          format_on_save =
            # Lua
            ''
              function(bufnr)
                local disable_filetypes = { c = true, cpp = true }
                return {
                  timeout_ms = 500,
                  lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
                }
              end
            '';
          formatters_by_ft = {
            nix = [
              "alejandra"
            ];
            "_" = [
              "squeeze_blanks"
              "trim_whitespace"
              "trim_newlines"
            ];
            terraform = ["terraform_fmt"];
            tf = ["terraform_fmt"];
            terraform-vars = ["terraform_fmt"];
            typescript = ["prettier"];
          };
        };
      };
    };
  };
}
