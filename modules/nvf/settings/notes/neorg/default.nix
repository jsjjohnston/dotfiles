{...}: {
  programs = {
    nvf = {
      settings = {
        vim = {
          notes = {
            neorg = {
              enable = true;
              setupOpts.load."core.defaults".enable = true;
            };
          };
        };
      };
    };
  };
}
