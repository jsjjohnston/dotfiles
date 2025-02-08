{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    # NOTE: use pack null to support config from macos but still configure until nixpkgs supports macos
    package = if pkgs.stdenv.hostPlatform.isDarwin then null else pkgs.ghostty;
    enableBashIntegration = true;
    settings = {
      theme = "cyberdream";
      font-size = 18;
      font-family = "FiraCode Nerd Font Mono";
      background-opacity = 0.2;
      background-blur-radius = 10;
    };
  };
}
