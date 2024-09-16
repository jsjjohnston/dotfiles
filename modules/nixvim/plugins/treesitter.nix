{...}: {
  programs.nixvim = {
    plugins = {
      enable = true;
      settings = {
        auto_install = true;
        ensure_installed = [];
      };
    };
  };
}
