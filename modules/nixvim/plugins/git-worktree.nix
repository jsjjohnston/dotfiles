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
        desc = "Git [W]orktree";
      };
    }
    {
      mode = "n";
      key = "<leader>gwc";
      action.__raw = ''
        function()
          require('telescope').extensions.git_worktree.create_git_worktree()
        end
      '';
      options = {
        desc = "[W]orktree [C]reate";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gws";
      action.__raw = ''
        function()
          require('telescope').extensions.git_worktree.git_worktrees()
        end
      '';
      options = {
        desc = "[S]witch / Delete worktree";
        silent = true;
      };
    }
  ];
}
