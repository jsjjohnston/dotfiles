{ ... }:
{
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
    };
    keymaps = [
      {
        mode = [ "n" ];
        key = "]c";
        action.__raw = ''
          function()
            if vim.wo.diff then
              vim.cmd.normal { ']c', bang = true}
            else
             require('gitsigns').nav_hunk 'next'
            end
           end
        '';
        options = {
          desc = "Jump To Next Git [C]hange";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>ghs";
        action.__raw = ''require('gitsigns').stage_hunk'';
        options = {
          desc = "Git Hunk [S]tage ";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>ghr";
        action.__raw = ''require('gitsigns').reset_hunk'';
        options = {
          desc = "Git Hunk [R]eset ";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>ghs";
        action.__raw = ''require('gitsigns').stage_buffer'';
        options = {
          desc = "Git [S]tage Hunk Buffer";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>ghu";
        action.__raw = ''require('gitsigns').undo_stage_hunk'';
        options = {
          desc = "Git [U]ndo Stage Hunk";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>ghr";
        action.__raw = ''require('gitsigns').reset_hunk'';
        options = {
          desc = "Git Hunk [R]eset Buffer";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>ghp";
        action.__raw = ''require('gitsigns').preview_hunk'';
        options = {
          desc = "Git [P]review Hunk";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>ghb";
        action.__raw = ''require('gitsigns').blame_line'';
        options = {
          desc = "Git [B]lame Line";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>ghd";
        action.__raw = ''require('gitsigns').diffthis'';
        options = {
          desc = "Git [d]iff Against Index";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>ghD";
        action.__raw = ''function() require('gitsigns').diffthis '@' end'';
        options = {
          desc = "Git [D]iff Against Last Commit";
        };
      }

      {
        mode = [ "n" ];
        key = "<leader>gtb";
        action.__raw = ''require('gitsigns').toggle_current_line_blame'';
        options = {
          desc = "Toggle Git Show [B]lame Line";
        };
      }

      {
        mode = [ "n" ];
        key = "<leader>gtd";
        action.__raw = ''require('gitsigns').toggle_deleted'';
        options = {
          desc = "Git Toggle Git Show [D]eleted";
        };
      }
    ];
  };
}
