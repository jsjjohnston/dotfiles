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
        style = "compact";
        inline_height = 40;
        preview_strategy = "static";
        max_preview_height = 20;
        network_connect_timeout = 60;
        network_timeout = 60;
      };
    };
  };
}
