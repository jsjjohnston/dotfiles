{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.darwinModules.sops
    ../../configuration/environment
    ../../configuration/garbage-collector
    ../../configuration/optimise
    ../../configuration/experimental-features
    ../../configuration/fonts
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
}
