{config, ...}: {
  programs.oh-my-posh = {
    enable = !config.programs.starship.enable;
    enableBashIntegration = true;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ./ohmyposhv3-v2.json));
  };
}
