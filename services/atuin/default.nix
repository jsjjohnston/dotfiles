{
  services.atuin = {
    enable = true;
    host = "0.0.0.0";
    openFirewall = true;
    openRegistration = true;
    database = {
      createLocally = true;
    };
  };
}
