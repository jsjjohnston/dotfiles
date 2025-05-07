{
  imports = [
    ../../configuration/environment
    ../../configuration/experimental-features
    ../../configuration/fonts
    ../../configuration/settings
    ../../configuration/substituters
    ../../services/adguardhome
    ../../services/atuin
    ../../services/avahi
    ../../services/caddy
    ../../services/cloudflared
    ../../services/home-assistant
    ../../services/ncps
    ../../services/ollama
    ../../services/openssh
    ../../services/postgresql
    ../../services/transmission
    ./hardware-configuration.nix
    ../../virtualisation/home-assistant
  ];
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = false;
      allowedTCPPorts = [8000 8123 8888 5000 53 2019 22];
      allowedUDPPorts = [53];
    };
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
