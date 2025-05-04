{
  services.caddy = {
    enable = true;
    email = "jsjjohnston@gmail.com";
    extraConfig = ''
       adhome.alda-row.home {
        reverse_proxy 127.0.0.1:3000
      }
    '';
  };
}
