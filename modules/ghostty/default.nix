{ ... }:
{
  programs.ghostty = {
    enable = true;
    # NOTE: use pack null to support config from macos but still configure until nixpkgs supports macos
    package = null; # TODO: make this conditional if system is macos
    enableBashIntegration = true;
    settings = {
      theme = "catppuccin-mocha";
      font-size = 10;
      keybind = [
        "ctrl+h=goto_split:left"
        "ctrl+l=goto_split:right"
      ];
    };
  };
}
