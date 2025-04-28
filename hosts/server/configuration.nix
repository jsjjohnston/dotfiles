{
  imports = [
    ./hardware-configuration.nix
    ../../services/ollama
    ../../services/home-assistant
    ../../services/postgresql
    ../../services/atuin
    ../../configuration/environment
    ../../configuration/garbage-collector
    ../../configuration/experimental-features
    ../../configuration/fonts
    ../../services/transmission
    ../../services/openssh
  ];
  networking = {
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [8123 8888];
    hostName = "jay-server";
  };

  time.timeZone = "Australia/Melbourne";
  i18n = {
    defaultLocale = "en_AU.UTF-8";
    supportedLocales = ["en_AU.UTF-8/UTF-8" "en_GB.UTF-8/UTF-8"];
    extraLocaleSettings = {
      LC_NUMERIC = "en_AU.UTF-8";
      LC_TIME = "en_AU.UTF-8";
      LC_MONETARY = "en_AU.UTF-8";
      LC_PAPER = "en_AU.UTF-8";
      LC_MEASUREMENT = "en_AU.UTF-8";
      LC_ADDRESS = "en_AU.UTF-8";
      LC_TELEPHONE = "en_AU.UTF-8";
      LC_NAME = "en_AU.UTF-8";
      LC_IDENTIFICATION = "en_AU.UTF-8";
      LANG = "en_AU.UTF-8";
    };
  };

  security.rtkit.enable = true;
  users.users.jay = {
    isNormalUser = true;
    description = "Jay Johnston";
    extraGroups = ["networkmanager" "wheel"];
  };

  system.stateVersion = "24.11";
}
