{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "7dafa20a-474c-44d7-a830-1f3feab323c0" = {
        credentialsFile = "/home/jay/.cloudflared/7dafa20a-474c-44d7-a830-1f3feab323c0.json";
        certificateFile = "/home/jay/.cloudflared/cert.pem";
        default = "http_status:404";
        ingress = {
          "ssh.aldarow.dev" = "ssh://localhost:22";
          "home.aldarow.dev" = "ssh://localhost:8123";
          "atuin.aldarow.dev" = "http://localhost:8888";
          "ncps.aldarow.dev" = "http://localhost:5000";
        };
      };
    };
  };
}
