{config, ...}: {
  nix.settings = {
    trusted-public-keys = [
      "my-cache:ZQiZIzpEmLe22JKUhV8sj02d5mq7HK5UVZXVWDlvhgc="
      "ncps.aldarow.dev:/yu7Apir5mzO8tcb/h8y3ySUSrWPCCVEG78EzTKkmWU="
    ];
    substituters =
      if config.networking.hostName == "jay-server"
      then [
        "http://localhost:5000"
        "https://cache.nixos.org/"
      ]
      else [
        "https://ncps.aldarow.dev"
        "https://cache.nixos.org/"
      ];
  };
}
