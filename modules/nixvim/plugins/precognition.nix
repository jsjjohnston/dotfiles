{
  programs.nixvim.plugins.precognition.enable = true;

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>vp";
      action.__raw = ''
        function()
          if require("precognition").toggle() then
              vim.notify("Precognition on")
          else
              vim.notify("Precognition off")
          end
        end
      '';

      options = {
        desc = "[P]recognition Toggle";
        silent = true;
      };
    }
  ];
}
