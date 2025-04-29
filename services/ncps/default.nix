{
  services.ncps = {
    enable = true;
    server.addr = "0.0.0.0:5000";

    upstream = {
      caches = [
        "https://cache.nixos.org"
      ];
      publicKeys = [
        "cache.nixos.org-1:"
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
