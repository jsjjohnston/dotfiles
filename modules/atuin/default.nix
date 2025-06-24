{
  programs = {
    atuin = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        auto_sync = true;
        sync_frequency = "15s";
        sync_address = "http://atuin.aldarow.dev";
        search_mode = "fuzzy";
        dialect = "uk";
        inline_height = 10;
      };
    };
  };
}
