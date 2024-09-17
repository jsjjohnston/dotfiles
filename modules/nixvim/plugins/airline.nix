{...}: {
  programs.nixvim.plugins = {
    airline = {
      enable = true;
      settings = {
        powerline_fonts = true;
        skip_empty_sections = true;
        theme = "angr";
      };
    };
  };
}
