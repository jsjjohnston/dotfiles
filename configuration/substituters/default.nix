{config, ...}: {
  nix.settings = {
    trusted-public-keys = [
      "my-cache:ZQiZIzpEmLe22JKUhV8sj02d5mq7HK5UVZXVWDlvhgc="
      "cache.nixos.org-1:"
    ];
    substituters =
      if config.networking.hostName == "jay-server"
      then [
        "http://localhost:5000"
        "https://cache.nixos.org/"
      ]
      else [
        "http://jay-server.local:5000"
        "https://cache.nixos.org/"
      ];
  };
}
