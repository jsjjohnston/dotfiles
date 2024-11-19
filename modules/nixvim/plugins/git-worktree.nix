{ config, lib, ... }:
let
  cfg = config.programs.nixvim.plugins.git-worktree;
in
{
  programs.nixvim.plugins = {
    git-worktree = {
      enable = true;
      enableTelescope = true;
    };

    which-key.settings.spec = lib.optionals (cfg.enableTelescope && cfg.enable) [
      {
        __unkeyed = "<leader>gW";
        group = "Worktree";
        icon = "󰙅 ";
      }
    ];
  };

  programs.nixvim.keymaps = lib.mkIf cfg.enableTelescope [
    {
      mode = "n";
      key = "<leader>sgw";
      action = "<cmd>Telescope git_worktree<CR>";
      options = {
        desc = "Git [W]orktree"; # # TODO: Update description for these mappings
      };
    }
    {
      mode = "n";
      key = "<leader>gWc";
      action.__raw = ''
        function()
          require('telescope').extensions.git_worktree.create_git_worktree()
        end
      '';
      options = {
        desc = "Create worktree"; # TODO: # TODO:Update Key Maps Description
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gWs";
      action.__raw = ''
        function()
          require('telescope').extensions.git_worktree.git_worktrees()
        end
      '';
      options = {
        desc = "Switch / Delete worktree"; # TODO: # TODO:Update Key Maps Description
        silent = true;
      };
    }
  ];
}
