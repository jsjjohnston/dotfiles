{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.nixvim.plugins = {
    codeium-nvim = {
      enable = true;

      settings = {
        enable_chat = false;

        tools = {
          curl = lib.getExe pkgs.curl;
          gzip = lib.getExe pkgs.gzip;
          uname = lib.getExe' pkgs.coreutils "uname";
          uuidgen = lib.getExe' pkgs.util-linux "uuidgen";
        };
      };
    };
  };

  programs.nixvim.keymaps = lib.mkIf config.programs.nixvim.plugins.codeium-nvim.enable [
    {
      mode = "n";
      key = "<leader>uc";
      action = "<cmd>Codeium Chat<CR>";
      options = {
        desc = "Codeium Chat";
      };
    }
  ];
}
