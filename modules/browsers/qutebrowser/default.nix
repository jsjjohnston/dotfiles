{
  imports = [
    ./aliases
    ./enableDefaultBindings
    ./keyBindings
    ./keyMappings
    ./quickmarks
    ./searchEngines
    ./settings
  ];
  programs = {
    qutebrowser = {
      enable = true;
      package = null;
      loadAutoconfig = true;
    };
  };
}
