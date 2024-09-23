{
  inputs,
  pkgs,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  nix.optimise = {
    automatic = true;
    dates = ["17:00"];
  };

  nix.gc = {
    automatic = true;
    dates = "18:00";
    options = "--delete-older-than 14d";
  };

  nixpkgs.config.allowUnfree = true;

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates = "18:30";
    randomizedDelaySec = "45min";
  };

  # Set your time zone.
  time.timeZone = "Australia/Melbourne";

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];

  environment.systemPackages = with pkgs; [
    zig
    google-chrome
    fzf
    delta
    alejandra
    ripgrep
    kitty
    dolphin
    gnome-keyring
    git
    gh
    rustup
    yazi
  ];
}
