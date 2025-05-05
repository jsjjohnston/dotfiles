{
  programs = {
    nvf = {
      enable = true;
      settings = {
        vim = {
          autopairs.nvim-autopairs = {
            enable = true;
            setupOpts = {
              check_ts = true;
            };
          };
        };
      };
    };
  };
}
