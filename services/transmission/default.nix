{
  services.transmission = {
    enable = true;
    openFirewall = true;
  };
  services.flood = {
    enable = true;
    openFirewall = true;
    host = "::";
    port = 3001;
  };
}
