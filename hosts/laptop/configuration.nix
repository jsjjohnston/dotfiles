{
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  time.hardwareClockInLocalTime = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 3d";
  };

  networking.hostName = "jay-nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Australia/Melbourne";

  i18n.defaultLocale = "en_AU.UTF-8";

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

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  programs = {
    hyprland = {
      enable = true;
    };
  };

  services.printing.enable = true;

  hardware = {
    pulseaudio.enable = false;
    graphics.enable = true;
    bluetooth.enable = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.jay = {
    isNormalUser = true;
    description = "Jay";
    extraGroups = ["networkmanager" "wheel"];
  };

  nixpkgs.config.allowUnfree = true;

  environment = {
    systemPackages = with pkgs; [
      waybar
      libnotify
      swww
      rofi-wayland
      git
      gh
      google-chrome
      alejandra
      ripgrep
      kitty
      dolphin
    ];
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
