{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        margin-top = 14;
        margin-bottom = 0;
        modules-left = [
          "wlr/taskbar"
        ];
        modules-center = [
          "bluetooth"
          "hyprland/workspaces"
        ];
        modules-right = [
          "mpd"
          "custom/mymodule#with-css-id"
          "battery"
          "temperature"
          "clock"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
        "hyprland/workspaces" = {
          format = "<sub>{icon}</sub>{windows}";
          window-rewrite-default = "";
          window-rewrite = {
            "title<.*youtube.*>" = "";
            "class<firefox>" = "";
            "class<firefox> title<.*github.*>" = "";
            "foot" = "";
            "code" = "󰨞";
          };
        };
        battery = {
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}% ";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          max-length = 25;
        };
        bluetooth = {
          # "controller": "controller1", // specify the alias of the controller if there are more than 1 on the system
          format = " {status}";
          format-disabled = "";
          format-connected = " {num_connections} connected";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        };
        clock = {
          interval = 60;
          format = "{:%H:%M %F}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          max-length = 25;
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-scroll-up = "tz_up";
            on-scroll-down = "tz_down";
            # on-scroll-up = "shift_up";
            # on-scroll-down = "shift_down";
          };
        };

      };
    };
    style = '''';
  };
}
