{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../services/ollama
    ../../services/home-assistant
    ../../services/postgresql
    ../../services/atuin
  ];
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "/dev/sda";
        useOSProber = true;
      };
    };
    initrd.services = {
      lvm.enable = true;
    };
  };

  networking = {
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [22 8123 8888];
    hostName = "jay-server";
  };

  time.timeZone = "Australia/Melbourne";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };
  services = {
    openssh = {
      enable = true;
    };
  };

  services.transmission.enable = true;

  security.rtkit.enable = true;
  users.users.jay = {
    isNormalUser = true;
    description = "Jay Johnston";
    extraGroups = ["networkmanager" "wheel"];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    bash-preexec
    bat
    jq
    gh
    git-credential-manager
    w3m
  ];

  system.stateVersion = "24.11";
}
