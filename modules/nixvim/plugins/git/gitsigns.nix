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
          desc = "Jump to next git [c]hange";
          # TODO: # TODO: update keymaps
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>hs";
        action.__raw = ''require('gitsigns').stage_hunk'';
        options = {
          desc = "git [s]tage hunk";
          # TODO: update keymaps
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>hr";
        action.__raw = ''require('gitsigns').reset_hunk'';
        options = {
          desc = "git [r]eset hunk";
          # TODO: update keymaps
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>hS";
        action.__raw = ''require('gitsigns').stage_buffer'';
        options = {
          desc = "git [S]tage buffer";
          # TODO: update keymaps
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>hu";
        action.__raw = ''require('gitsigns').undo_stage_hunk'';
        options = {
          desc = "git [u]ndo stage hunk";
          # TODO: update keymaps
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>hR";
        action.__raw = ''require('gitsigns').reset_hunk'';
        options = {
          desc = "git [R]eset Buffer";
          # TODO: update keymaps
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>hp";
        action.__raw = ''require('gitsigns').preview_hunk'';
        options = {
          desc = "git [p]review hunk";
          # TODO: update keymaps
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>hb";
        action.__raw = ''require('gitsigns').blame_line'';
        options = {
          desc = "git [b]lame line";
          # TODO: update keymaps
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>hd";
        action.__raw = ''require('gitsigns').diffthis'';
        options = {
          desc = "git [d]iff against index";
          # TODO: update keymaps
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>hD";
        action.__raw = ''function() require('gitsigns').diffthis '@' end'';
        options = {
          desc = "git [D]iff against last commit";
          # TODO: update keymaps
        };
      }

      {
        mode = [ "n" ];
        key = "<leader>tb";
        action.__raw = ''require('gitsigns').toggle_current_line_blame'';
        options = {
          desc = "[t]oggle git show [b]lame line";
          # TODO: update keymaps
        };
      }

      {
        mode = [ "n" ];
        key = "<leader>tD";
        action.__raw = ''require('gitsigns').toggle_deleted'';
        options = {
          desc = "[t]oggle git show [D]eleted";
          # TODO: update keymaps
        };
      }
    ];
  };
}
