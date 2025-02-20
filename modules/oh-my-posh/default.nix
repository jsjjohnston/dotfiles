{config, ...}: {
  programs.oh-my-posh = {
    enable = !config.programs.starship.enable;
    enableBashIntegration = true;
    # useTheme = "rudolfs-dark";
    settings =
      builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ./ohmyposhv3-v2.json));
  };
}
