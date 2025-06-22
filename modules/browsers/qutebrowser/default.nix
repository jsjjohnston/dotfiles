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
    qutebrowser.enable = true;
    qutebrowser.loadAutoconfig = true;
  };
}
