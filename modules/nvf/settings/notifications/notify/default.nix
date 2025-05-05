{
  programs = {
    nvf = {
      settings = {
        vim = {
          notify.nvim-notify = {
            enable = true;
            setupOpts = {
              background_colour = "#000000";
              stages = "fade_in_slide_out";
              timeout = 3000;
              top_down = false;
            };
          };
        };
      };
    };
  };
}
