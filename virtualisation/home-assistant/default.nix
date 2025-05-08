{
  virtualisation.oci-containers = {
    backend = "podman";
    containers.homeassistant = {
      volumes = ["home-assistant:/config"];
      environment.TZ = "Australia/Melbourne";
      image = "ghcr.io/home-assistant/home-assistant:latest"; # Warning: if the tag does not change, the image will not be updated
      extraOptions = [
        "--network=host"
      ];
    };
  };
  networking.firewall.allowedTCPPorts = [8123];
}
