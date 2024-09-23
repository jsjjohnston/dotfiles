{...}: {
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    openFirewall = true;
    loadModels = ["llama3.1"];
    host = "0.0.0.0";
  };
}
