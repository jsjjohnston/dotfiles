{ pkgs, ... }:
let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
  '';
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      general = {
        gaps_in = 2;
        gaps_out = 0;
        border_size = 1;
        resize_on_border = false;
        allow_tearing = false;
        layout = "master";
        # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        # "col.inactive_border" = "rgba(595959aa)";
      };

      decoration = {
        rounding = 1;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        blur = {
          enabled = true;
          size = 1;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        # follow_mouse = 1;
      };

      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$menu" = "rofi -show run";
      "$fileManager" = "yazi";
      "$browser" = "firefox";

      monitor = ",2256x1504,0x0,1";

      bind = [
        "$mod, Q, exec, $terminal"
        "$mod, F, exec, $browser"
        "$mod, C, killactive"
        "$mod, M, exit"
        "$mod, E, exec, $fileManager"
        "$mod, V, togglefloating"
        "$mod, SPACE, exec, $menu"
        "$mod, P, exec, pseudo"
        "$mod, J, togglesplit"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mod, S, layoutmsg, swapwithmaster"
        "$mod, F, layoutmsg, focusmaster"
        "$mod, N, layoutmsg, cyclenext"
        "$mod, P, layoutmsg, cycleprev"
        "$mod, >, layoutmsg, swapnext"
        "$mod, <, layoutmsg, swapprev"
        "$mod, H, layoutmsg, orientationleft"
        "$mod, J, layoutmsg, orientationbottom"
        "$mod, K, layoutmsg, orientationtop"
        "$mod, L, layoutmsg, orientationright"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
      ];
      exec-once = ''${startupScript}/bin/start'';
      windowrulev2 = "float, class:(drun)";
    };
  };
}
