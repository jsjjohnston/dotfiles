{
  programs = {
    atuin = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        auto_sync = true;
        sync_frequency = "30s";
        sync_address = "http://192.168.1.106:8888";
        search_mode = "prefix";
      };
    };
  };
}
