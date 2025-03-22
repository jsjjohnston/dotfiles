{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    openFirewall = true;
    loadModels = ["gemma3"];
    host = "0.0.0.0";
  };
}
