{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "90a761ed-96cb-4b8d-9be6-da68784001aa" = {
        credentialsFile = "/home/jay/.cloudflared/90a761ed-96cb-4b8d-9be6-da68784001aa.json";
        default = "http_status:404";
        ingress = {
          "*.aldarow.dev" = {
            service = "http://localhost:8000";
          };
        };
      };
    };
  };
}
