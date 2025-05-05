{
  programs.nvf.settings.vim.fzf-lua = {
    enable = true;
    setupOpts = {
      winopts = {
        preview = {
          default = "bat";
          layout = "vertical";
          wrap = "nowrap";
        };
        height = 0.85;
        width = 0.85;
        border = "rounded";
      };

      fzf_opts = {
        "--ansi" = true;
        "--info" = "inline";
        "--layout" = "reverse";
        "--prompt" = "❯ ";
      };

      files = {
        fd_opts = "--type f --hidden --follow --exclude .git";
      };

      grep = {
        rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case -g '!{.git,node_modules}/*'";
      };
    };
  };
}
