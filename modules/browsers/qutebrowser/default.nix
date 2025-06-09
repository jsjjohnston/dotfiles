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
    # aerospace.userSettings.start-at-login = true;
    qutebrowser.enable = true;
    qutebrowser.loadAutoconfig = false;
  };
}
