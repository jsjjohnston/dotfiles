{
  services.home-assistant = {
    enable = false;
    configWritable = false;
    extraComponents = ["aws"];
    config = {
      homeassistant = {
        unit_system = "metric";
        time_zone = "Australia/Melbourne";
        temperature_unit = "C";
        name = "Alda row";
      };
      http.server_host = [
        "0.0.0.0"
        "::"
      ];
      http.server_port = 8123;
    };
  };
}
