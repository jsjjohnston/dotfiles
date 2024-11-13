{ config, lib, ... }:
{
  programs.nixvim.plugins.markdown-preview = {
    enable = true;

    settings = {
      auto_close = 0;
      theme = "dark";
    };
  };

  programs.nixvim.keymaps = lib.mkIf config.programs.nixvim.plugins.markdown-preview.enable [
    {
      mode = "n";
      key = "<leader>pm";
      action = "<cmd>MarkdownPreview<cr>";
      options = {
        desc = "Markdown Preview"; # TODO: Update description for these mappings
      };
    }
  ];
}
