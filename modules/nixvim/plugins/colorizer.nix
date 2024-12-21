{
  config,
  lib,
  ...
}:
{
  programs.nixvim.plugins = {
    colorizer = {
      enable = false;
    };
  };

  programs.nixvim.keymaps = lib.mkIf config.programs.nixvim.plugins.colorizer.enable [
    {
      mode = "n";
      key = "<leader>tc";
      action.__raw = ''
        function ()
         vim.g.colorizing_enabled = not vim.g.colorizing_enabled
         vim.cmd('ColorizerToggle')
         vim.notify(string.format("Colorizing %s", bool2str(vim.g.colorizing_enabled), "info"))
        end
      '';
      options = {
        desc = "Toggle [C]olorizing";
        silent = true;
      };
    }
  ];
}
