{
  programs = {
    nvf = {
      settings = {
        vim = {
          autocomplete = {
            blink-cmp = {
              enable = true;
              setupOpts.signature.enabled = true;
              friendly-snippets.enable = true;
              sourcePlugins = {
                emoji.enable = true;
                ripgrep.enable = true;
                spell.enable = true;
                "cmp-nvim-lsp".enable = true;
              };
            };
          };
        };
      };
    };
  };
}
