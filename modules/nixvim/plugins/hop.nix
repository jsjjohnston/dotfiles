{ config, lib, ... }:
{
  programs.nixvim.plugins = {
    hop = {
      enable = true;
    };
  };
  programs.nixvim.keymaps = lib.optionals config.programs.nixvim.plugins.hop.enable [
    {
      key = "f";
      action.__raw = ''
        function()
          require'hop'.hint_char1({
            direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
          })
        end
      '';
      options = {
        remap = true;
        desc = "Hop [f]orward";
      };
    }
    {
      key = "F";
      action.__raw = ''
        function()
          require'hop'.hint_char1({
            direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
          })
        end
      '';
      options = {
        remap = true;
        desc = "Hop Back [F]orward";
      };
    }
    {
      key = "t";
      action.__raw = ''
        function()
          require'hop'.hint_char1({
            direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
            hint_offset = -1
          })
        end
      '';
      options = {
        remap = true;
        desc = "Hop [t]oward";
      };
    }
    {
      key = "T";
      action.__raw = ''
        function()
          require'hop'.hint_char1({
            direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
            hint_offset = 1
          })
        end
      '';
      options = {
        remap = true;
        desc = "Hop Back [T]oward";
      };
    }
  ];
}
