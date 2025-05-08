{
  nix = {
    settings = {
      trusted-public-keys = [
        "my-cache:ZQiZIzpEmLe22JKUhV8sj02d5mq7HK5UVZXVWDlvhgc="
      ];
      trusted-users = [
        "root"
        "jay"
        "@wheel"
      ];
    };
  };
}
