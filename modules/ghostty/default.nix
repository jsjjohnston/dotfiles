{pkgs, ...}: {
  home.file = {
    cyberdream = {
      source = ./themes/cyberdream;
      target = ".config/ghostty/themes/cyberdream";
    };
  };
  programs.ghostty = {
    enable = true;
    # NOTE: use pack null to support config from macos but still configure until nixpkgs supports macos
    package =
      if pkgs.stdenv.hostPlatform.isDarwin
      then null
      else pkgs.ghostty;
    enableBashIntegration = true;
    settings = {
      theme = "cyberdream";
      font-size = 18;
      font-family = "FiraCode Nerd Font Mono";
      background-opacity = 0.2;
      background-blur-radius = 10;
      window-padding-x = 10;
      auto-update = "off";
      desktop-notifications = true;
      shell-integration = "bash";
      confirm-close-surface = false;
      copy-on-select = true;
    };
  };
}
