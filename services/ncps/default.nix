{
  services.ncps = {
    enable = true;
    server.addr = "0.0.0.0:5000";

    upstream = {
      caches = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];
      publicKeys = [
        "cache.nixos.org-1:"
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

    cache = {
      dataPath = "/var/lib/ncps/cache";
      maxSize = "50G";
      hostName = "jay-server";
    };

    logLevel = "info";
  };
}
