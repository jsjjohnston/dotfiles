{ config, lib, ... }:
let
  cfg = config.programs.nixvim.plugins.gitignore;
in
{
  programs.nixvim.plugins = {
    gitignore = {
      enable = true;
    };
  };

  programs.nixvim.keymaps = lib.mkIf cfg.enable [
    {
      mode = "n";
      key = "<leader>gi";
      action.__raw = ''require('gitignore').generate'';
      options = {
        desc = "Gitignore generate";
        silent = true;
      };
    }
  ];
}
