{ config, lib, ... }:
{
  programs.nixvim.plugins = {
    nvim-snippets = {
      enable = true;
      settings = {
        friendly_snippets = true;
      };
    };

  };
}
