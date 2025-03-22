{
  services.home-assistant = {
    enable = true;
    config = {
      homeassistant = {
        home = "home";
        lattitude = -63.35;
        longitude = 103.48;
        unit_system = "metric";
        time_zone = "UTC";
      };
    };
  };
}
