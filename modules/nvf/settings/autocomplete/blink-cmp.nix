{...}: {
  programs = {
    nvf = {
      settings = {
        vim = {
          autocomplete = {
            blink-cmp = {
              enable = true;
              setupOpts.signature.enabled = true;
            };
          };
        };
      };
    };
  };
}
