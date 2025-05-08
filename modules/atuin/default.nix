{
  programs = {
    atuin = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        auto_sync = true;
        sync_frequency = "15s";
        sync_address = "http://atuin.aldarow.dev";
        search_mode = "prefix";
      };
    };
  };
}
