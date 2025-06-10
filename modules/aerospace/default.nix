{
  programs.sketchybar = {
    enable = true;
    config = ''
      # Define colors
      export COLOR_BLACK="0xff181926"
      export COLOR_WHITE="0xffcad3f5"

      # Configure bar
      sketchybar --bar height=32 \
                      position=top \
                      padding_left=10 \
                      padding_right=10 \
                      color=$COLOR_BLACK

      # Configure default values
      sketchybar --default icon.font="SF Pro:Bold:14.0" \
                          icon.color=$COLOR_WHITE \
                          label.font="SF Pro:Bold:14.0" \
                          label.color=$COLOR_WHITE

      # Add items to the bar
      sketchybar --add item clock right \
                --set clock script="date '+%H:%M'" \
                            update_freq=10

      # Update the bar
      sketchybar --update
    '';
  };
  programs.aerospace = {
    enable = true;
    userSettings = {
      after-login-command = [];
      exec-on-workspace-change = [
        "/bin/bash"
        "-c"
        "sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE"
        "exec-and-forget borders active_color=0xffe1e3e4 inactive_color=0xff494d64 width=5.0"
      ];
      after-startup-command = [
        "exec-and-forget sketchybar"
      ];
      start-at-login = true;
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];
      on-window-detected = [
        {
          "if" = {
            app-id = "com.mitchellh.ghostty";
          };
          run = "move-node-to-workspace T";
        }
        {
          "if" = {
            app-id = "com.github.th-ch.youtube-music";
          };
          check-further-callbacks = true;
          run = [
            "move-node-to-workspace Y"
          ];
        }
        {
          "if" = {
            app-id = "com.tinyspeck.slackmacgap";
          };
          check-further-callbacks = true;
          run = [
            "move-node-to-workspace S"
          ];
        }
        {
          "if" = {
            app-id = "company.thebrowser.Browser";
          };
          check-further-callbacks = true;
          run = [
            "move-node-to-workspace B"
          ];
        }
        # Google Meets
        {
          "if" = {
            app-id = "com.google.Chrome.app.kjgfgldnnfoeklkmfkjfagphfepbbdan";
          };
          check-further-callbacks = true;
          run = [
            "move-node-to-workspace M"
          ];
        }
        # BrewFather
        {
          "if" = {
            app-id = "com.google.Chrome.app.jgclhcifjnkepcjdfhcnfjgojgddndpj";
          };
          check-further-callbacks = true;
          run = [
            "move-node-to-workspace B"
          ];
        }
        # YouTube
        {
          "if" = {
            app-id = "com.google.Chrome.app.agimnkijcaahngcdmfeangaknmldooml";
          };
          check-further-callbacks = true;
          run = [
            "move-node-to-workspace U"
          ];
        }
        # Jira
        {
          "if" = {
            app-id = "com.google.Chrome.app.kjinebmcjkepbbjjnliejcackejggmhj";
          };
          check-further-callbacks = true;
          run = [
            "move-node-to-workspace I"
          ];
        }
        # GitHub
        {
          "if" = {
            app-id = "com.google.Chrome.app.mjoklplbddabcmpepnokjaffbmgbkkgg";
          };
          check-further-callbacks = true;
          run = [
            "move-node-to-workspace G"
          ];
        }
        # Google Calendar
        {
          "if" = {
            app-id = "com.google.Chrome.app.kjbdgfilnfhdoflbpgamdcdgpehopbep";
          };
          check-further-callbacks = true;
          run = [
            "move-node-to-workspace C"
          ];
        }
        # Gmail
        {
          "if" = {
            app-id = "com.google.Chrome.app.fmgjjmmmlfnkbppncabfkddbjimcfncm";
          };
          check-further-callbacks = true;
          run = [
            "move-node-to-workspace E"
          ];
        }
      ];

      # run = 'move-node-to-workspace T'";
      # You can effectively turn off macOS "Hide application" (cmd-h) feature by toggling this flag
      # Useful if you don"t use this macOS feature, but accidentally hit cmd-h or cmd-alt-h key
      automatically-unhide-macos-hidden-apps = true;

      key-mapping.preset = "qwerty";

      gaps = {
        inner = {
          horizontal = 0;
          vertical = 0;
        };
        outer = {
          left = 0;
          bottom = 0;
          top = 0;
          right = 0;
        };
      };

      mode.main.binding = {
        cmd-h = [];
        cmd-alt-h = [];
        cmd-tab = [];
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";
        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";
        alt-minus = "resize smart -50";
        alt-equal = "resize smart +50";
        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        alt-a = "workspace A";
        alt-b = "workspace B";
        alt-c = "workspace C";
        alt-d = "workspace D";
        alt-e = "workspace E";
        alt-g = "workspace G";
        alt-i = "workspace I";
        alt-m = "workspace M";
        alt-n = "workspace N";
        alt-o = "workspace O";
        # alt-p = "workspace P";
        # alt-q = "workspace Q";
        # alt-r = "workspace R";
        alt-s = "workspace S";
        alt-t = "workspace T";
        alt-u = "workspace U";
        # alt-v = "workspace V";
        # alt-w = "workspace W";
        # alt-x = "workspace X";
        alt-y = "workspace Y";
        # alt-z = "workspace Z";
        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";

        alt-tab = "workspace-back-and-forth";
        alt-shift-semicolon = "mode service";
        alt-enter = "exec-and-forget open -n /Applications/Ghostty.app";
        alt-f = "fullscreen on  --no-outer-gaps --fail-if-noop";
      };
      mode.service.binding = {
        esc = ["reload-config" "mode main"];
        r = ["flatten-workspace-tree" "mode main"];
        f = ["layout floating tiling" "mode main"];
        backspace = ["close-all-windows-but-current" "mode main"];
        alt-shift-h = ["join-with left" "mode main"];
        alt-shift-j = ["join-with down" "mode main"];
        alt-shift-k = ["join-with up" "mode main"];
        alt-shift-l = ["join-with right" "mode main"];
        down = "volume down";
        up = "volume up";
        shift-down = ["volume set 0" "mode main"];
      };
    };
  };
}
