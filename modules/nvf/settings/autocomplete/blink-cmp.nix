{
  programs = {
    nvf = {
      settings = {
        vim = {
          autocomplete = {
            blink-cmp = {
              enable = true;
              setupOpts = {
                signature = {
                  enabled = true;
                };
                completion = {
                  documentation = {
                    auto_show = true;
                    auto_show_delay_ms = 500;
                  };
                  ghost_text = {
                    show_with_menu = false;
                    enabled = true;
                  };
                  menu.auto_show = false;
                };
              };
              friendly-snippets = {
                enable = true;
              };
              sourcePlugins = {
                spell = {
                  enable = true;
                };
                emoji = {
                  enable = true;
                };
                ripgrep = {
                  enable = true;
                };
              };
            };
          };
        };
      };
    };
  };
}
