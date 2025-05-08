{
  programs.nvf.settings.vim.git.gitsigns = {
    enable = true;
    codeActions.enable = true;
    mappings = {
      blameLine = "<leader>hb";
      diffProject = "<leader>hD";
      diffThis = "<leader>hd";
      nextHunk = "]c";
      previousHunk = "[c";
      previewHunk = "<leader>hP";
      resetBuffer = "<leader>hR";
      resetHunk = "<leader>hr";
      stageBuffer = "<leader>hS";
      stageHunk = "<leader>hs";
      toggleBlame = "<leader>tb";
      toggleDeleted = "<leader>td";
      undoStageHunk = "<leader>hu";
    };

    setupOpts = {
      signs = {
        add = {text = "+";};
        change = {text = "~";};
        delete = {text = "_";};
        topdelete = {text = "‾";};
        changedelete = {text = "~";};
        untracked = {text = "┆";};
      };

      current_line_blame = true;
      current_line_blame_opts = {
        virt_text = true;
        virt_text_pos = "eol"; # "eol" | "overlay" | "right_align"
        delay = 500;
        ignore_whitespace = false;
      };

      signcolumn = true;
      numhl = false;
      linehl = false;
      watch_gitdir = {
        interval = 1000;
        follow_files = true;
      };

      update_debounce = 100;
      max_file_length = 40000;
    };
  };
}
