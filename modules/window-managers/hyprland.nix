{ pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };
    settings = {
      input = {
        kb_layout = "us";
      };
      "$mod" = "SUPER";
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
      bind =
        [
          "SUPER, F, exec, firefox"
          "SUPER, Q, exec, kitty"
          "SUPER, M, exit"
          "SUPER, SPACE, exec, rofi"
          ", Print, exec, grimblast copy area"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (
            builtins.genList (
              i:
              let
                ws = i + 1;
              in
              [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            ) 9
          )
        );
    };
  };
}
