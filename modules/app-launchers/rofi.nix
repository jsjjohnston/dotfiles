{
  config,
  pkgs,
  lib,
  ...
}: let
  rofi = config.home-manager.users.${config.user}.programs.rofi.finalPackage;
in {
  imports = [
    # ./rofi/power.nix
    # ./rofi/brightness.nix
  ];

  config = lib.mkIf (pkgs.stdenv.isLinux && config.services.xserver.enable) {
    home-manager.users.${config.user} = {
      home.packages = with pkgs; [
        jq # Required for rofi-systemd
      ];

      programs.rofi = {
        enable = true;
      };

      home.file.".local/share/rofi/themes" = {
        recursive = true;
        source = ./rofi/themes;
      };
    };

     };
}
