{...}: {
  programs.nixvim.plugins = {
    lint = {
      enable = true;
      lintersByFt = {
        dockerfile = [
          "hadolint"
        ];
        text = [
          "vale"
        ];
      };
    };
  };
}
