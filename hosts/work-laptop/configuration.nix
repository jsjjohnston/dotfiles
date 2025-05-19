{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.darwinModules.sops
    ../../configuration/environment
    ../../configuration/experimental-features
    ../../configuration/fonts
    ../../configuration/linux-builder
    ../../configuration/sops
    ../../configuration/substituters
    ../../configuration/timeZone
    ../../configuration/trusted-public-keys
    ../../configuration/trusted-users
    ../../configuration/programs
    ../../services/darwin/skhd
    ../../services/darwin/yabi
    ../../services/nix-daemon
  ];

  nix = {
    settings = {
      trusted-users = [
        "root"
        "jay"
        "@wheel"
      ];
    };
    package = pkgs.nix; # TODO: Do I need this?
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  system.primaryUser = "jay";
}
