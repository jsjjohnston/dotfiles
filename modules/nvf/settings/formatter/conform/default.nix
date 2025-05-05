{pkgs, ...}: {
  programs = {
    nvf = {
      settings = {
        vim = {
          formatter = {
            conform-nvim = {
              enable = true;
              setupOpts.formatters_by_ft = {
                javascript = ["eslint_d"];
                typescript = ["eslint_d"];
                python = ["ruff"];
                css = ["stylelint"];
                scss = ["stylelint"];
                json = ["prettier"];
                markdown = ["prettier"];
                yaml = ["prettier"];
                nix = ["alejandra"];
              };

              setupOpts.format_on_save = {
                lspFallback = true;
                timeoutMs = 2000;
              };
            };
          };
        };
      };
    };
  };
  home.packages = with pkgs; [
    nodePackages.eslint_d
    nodePackages.prettier
    ruff
    stylelint
    alejandra
  ];
}
