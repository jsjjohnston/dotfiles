{lib, ...}: {
  imports = [
    ./nvim-lint
  ];
  programs.nvf.settings.vim.diagnostics = {
    enable = true;

    config = {
      virtual_text = {
        spacing = 2;
        prefix = "●"; # Alternatives: "■", "→", "◆"
        format = lib.generators.mkLuaInline ''
          function(diagnostic)
            return string.format("%s (%s)", diagnostic.message, diagnostic.source or "")
          end
        '';
      };

      signs = {
        text = {
          "vim.diagnostic.severity.ERROR" = "";
          "vim.diagnostic.severity.WARN" = "";
          "vim.diagnostic.severity.INFO" = "";
          "vim.diagnostic.severity.HINT" = "󰌵";
        };
      };

      underline = true;
      virtual_lines = false;
      severity_sort = true;
      update_in_insert = false;

      float = {
        border = "rounded";
        source = "always"; # Show diagnostic source (e.g. eslint, pylint)
      };
    };
  };
  # programs.nvf.settings.vim.diagnostics = {
  #   enable = true;
  #   config = {
  #     virtual_text = true;
  #   };
  # };
}
