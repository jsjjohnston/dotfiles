{
  lib,
  pkgs,
  ...
}: {
  nix.settings = {
    builders-use-substitutes = true;
    # extra substituters to add
    extra-substituters = [
      "https://anyrun.cachix.org"
    ];

    extra-trusted-public-keys = [
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
    ];
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    sugarCandyNix = {
      enable = true;
      settings = {
        Background = lib.cleanSource ../../images/sddm.jpg;
        PartialBlur = true;
        AccentColor = "#123456";
        HeaderText = "All Thing Shall Pass";
      };
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
      hyprland.default = ["gtk" "hyprland"];
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
      swww
      kitty
      dolphin
      dunst
      mako
      sway
      cliphist
      wl-clip-persist
      gnome-keyring
      rustup
      hyprpicker
      blueberry
      nm-applet
    ];
  };
}
