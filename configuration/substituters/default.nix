{
  nix = {
    settings = {
      trusted-public-keys = [
        "my-cache:ZQiZIzpEmLe22JKUhV8sj02d5mq7HK5UVZXVWDlvhgc="
      ];
      substituters = [
        "http://jay-server.local:5000"
        "http://localhost:5000"
        "https://cache.nixos.org/"
      ];
    };
  };
}
