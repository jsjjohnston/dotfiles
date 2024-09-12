{...}: {
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
        };
      };
    };
  };
}
