{ pkgs, ... }:
let
  pactl = "${pkgs.pulseaudioFull}/bin/pactl";
in
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
          "hyprland/window"
          "pulseaudio"
        ];
        modules-center = [
          "bluetooth"
          "hyprland/workspaces"
          "cpu"
        ];
        modules-right = [
          "mpd"
          "battery"
          "temperature"
          "network"
          "clock"
        ];
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphones = "";
            handsfree = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "${pactl} set-sink-mute @DEFAULT_SINK@ toggle";
          on-scroll-up = "${pactl} set-sink-volume @DEFAULT_SINK@ +1%";
          on-scroll-down = "${pactl} set-sink-volume @DEFAULT_SINK@ -1%";
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            urgent = "";
            active = "";
            default = "";
          };
          sort-by-number = true;
        };
        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
          ];
        };
        cpu = {
          interval = 10;
          format = "`{usage}{icon}";
          states = {
            warning = 70;
            critical = 90;
          };
          tooltip = false;
          format-icons = [
            "<span color='#69ff94'>▁</span>"
            "<span color='#2aa9ff'>▂</span>"
            "<span color='#f8f8f2'>▃</span>"
            "<span color='#f8f8f2'>▄</span>"
            "<span color='#ffffa5'>▅</span>"
            "<span color='#ffffa5'>▆</span>"
            "<span color='#ff9977'>▇</span>"
            "<span color='#dd532e'>█</span>"
          ];
        };
        "hyprland/window" = {

          format = "👉 {}";
          rewrite = {
            # TODO: Create Custom rewrites
            # "(.*) — Mozilla Firefox" = "🌎 $1";
            # "(.*) - fish" = "> [$1]";
          };
          separate-outputs = true;

          battery = {
            bat = "BAT2";
            states = {
              good = 90;
              warning = 30;
              critical = 15;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% ";
            format-plugged = "{capacity}% ";
            format-alt = "{time} {icon}";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
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
            format = "{:%H:%M}";
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
    };
    style = ''
      * {
                border: none;
                border-radius: 0;
                font-family: Hack, FontAwesome5Free;
                font-size: 14px;
                min-height: 0;
            }
            window#waybar {
                background-color: rgba(43, 48, 59, 0.5);
                border-bottom: 3px solid rgba(100, 114, 125, 0.5);
                color: #ffffff;
                transition-property: background-color;
                transition-duration: .5s;
            }
            window#waybar.hidden {
                opacity: 0.2;
            }
            #workspaces button {
                padding: 0 5px;
                background-color: transparent;
                color: #ffffff;
                border-bottom: 3px solid transparent;
            }
            #workspaces button:hover {
                background: rgba(0, 0, 0, 0.2);
                box-shadow: inherit;
                border-bottom: 3px solid #ffffff;
            }
            #workspaces button.focused {
                background-color: #64727D;
                border-bottom: 3px solid #ffffff;
            }
            #workspaces button.urgent {
                background-color: #eb4d4b;
            }
            #mode {
                background-color: #64727D;
                border-bottom: 3px solid #ffffff;
            }
            #clock,
            #battery,
            #cpu,
            #memory,
            #temperature,
            #backlight,
            #network,
            #pulseaudio,
            #custom-media,
            #tray,
            #mode,
            #idle_inhibitor {
              padding: 0 10px;
              margin: 0 4px;
              color: #ffffff;
            }
            #clock {
                background-color: #64727D;
            }
            #battery {
                background-color: #ffffff;
                color: #000000;
            }
            #battery.charging {
                color: #ffffff;
                background-color: #26A65B;
            }
            @keyframes blink {
                to {
                    background-color: #ffffff;
                    color: #000000;
                }
            }
            #battery.critical:not(.charging) {
                background-color: #f53c3c;
                color: #ffffff;
                animation-name: blink;
                animation-duration: 0.5s;
                animation-timing-function: linear;
                animation-iteration-count: infinite;
                animation-direction: alternate;
            }
            label:focus {
                background-color: #000000;
            }
            #cpu {
                background-color: #2ecc71;
                color: #000000;
            }
            #memory {
                background-color: #9b59b6;
            }
            #backlight {
                background-color: #90b1b1;
            }
            #network {
                background-color: #2980b9;
            }
            #network.disconnected {
                background-color: #f53c3c;
            }
            #pulseaudio {
                background-color: #f1c40f;
                color: #000000;
            }
            #pulseaudio.muted {
                background-color: #90b1b1;
                color: #2a5c45;
            }
            #temperature {
                background-color: #f0932b;
            }
            #temperature.critical {
                background-color: #eb4d4b;
            }
            #tray {
                background-color: #2980b9;
            }
            #idle_inhibitor {
                background-color: #2d3436;
            }
            #idle_inhibitor.activated {
                background-color: #ecf0f1;
                color: #2d3436;
            }
    '';
  };
}
