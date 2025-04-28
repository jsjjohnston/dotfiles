{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.darwinModules.sops
    ../../configuration/environment
    ../../configuration/garbage-collector
    ../../configuration/experimental-features
    ../../configuration/fonts
    ../../services/darwin/yabi
    ../../services/darwin/skhd
  ];

  sops = {
    defaultSopsFile = ../../secrets/secret.yaml;
    age.keyFile = "/Users/jay/.config/sops/age/keys.txt";
  };

  nix = {
    settings = {
      trusted-users = [
        "root"
        "jay"
        "@wheel"
      ];
    };
    linux-builder.enable = true;
    linux-builder.systems = ["aarch64-linux"];

    package = pkgs.nix;
  };

  time.timeZone = "Australia/Melbourne";
  system.activationScripts.checkLaunchDaemons = "";
  services.nix-daemon.tempDir = "/nix/tmp";
  programs = {
    bash = {
      enable = true;
      completion = {
        enable = true;
      };
    };
    direnv = {
      enable = true;
    };

    zsh.enable = true;
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
}
