{config, ...}: {
  nix.settings = {
    trusted-public-keys = [
      "my-cache:ZQiZIzpEmLe22JKUhV8sj02d5mq7HK5UVZXVWDlvhgc="
    ];
    substituters =
      if config.networking.hostName == "jay-server"
      then [
        "http://localhost:5000"
        "https://cache.nixos.org/"
      ]
      else [
        "https://ncps.aldarow.org"
        "https://cache.nixos.org/"
      ];
  };
}
