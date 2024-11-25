{
  lib,
  config,
  ...
}:
{
  programs.nixvim.plugins = {
    comment-box = {
      enable = true;

      settings = {
        # TODO: customize comment box
        #   borders = {
        #     bottom_left = "X";
        #     bottom_right = "X";
        #     top_left = "X";
        #     top_right = "X";
        #   };
        #   box_width = 120;
        #   comment_style = "block";
        #   doc_width = 100;
        #   inner_blank_lines = true;
        #   line_width = 40;
        #   lines = {
        #     line = "*";
        #   };
        #   outer_blank_lines_below = true;
      };
    };

    which-key.settings.spec = lib.optionals config.programs.nixvim.plugins.comment-box.enable [
      {
        __unkeyed = "<leader>cb";
        group = "Comment-[B]ox";
        icon = " ";
      }
    ];
  };

  programs.nixvim.keymaps = lib.mkIf config.programs.nixvim.plugins.comment-box.enable [
    {
      mode = "n";
      key = "<leader>cbd";
      action = "<cmd>CBd<cr>";
      options = {
        desc = "[D]elete a Comment-box";
      };
    }
    {
      mode = "n";
      key = "<leader>cbb";
      action = "<cmd>CBccbox<cr>";
      options = {
        desc = "Comment-box [B]ox Title";
      };
    }
    {
      mode = "n";
      key = "<leader>cbt";
      action = "<cmd>CBllline<cr>";
      options = {
        desc = "Comment-box [T]itle Line";
      };
    }
    {
      mode = "n";
      key = "<leader>cbl";
      action = "<cmd>CBline<cr>";
      options = {
        desc = "comment-box Simple [L]ine";
      };
    }
  ];
}
