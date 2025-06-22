{
  programs.aerospace = {
    enable = true;
    userSettings = {
      after-login-command = [];
      exec-on-workspace-change = [
        "/bin/bash"
        "-c"
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
            app-id = "com.1password.1password";
          };
          run = "move-node-to-workspace 1";
        }
        {
          "if" = {
            app-id = "com.google.Chrome.app.eknfgdpolckkgbcoekheljddfmehpodi";
          };
          run = "move-node-to-workspace P";
        }
        {
          "if" = {
            app-id = "com.mitchellh.ghostty";
          };
          run = "move-node-to-workspace Q";
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
            app-id = "org.qutebrowser.qutebrowser";
          };
          check-further-callbacks = true;
          run = [
            "move-node-to-workspace A"
          ];
        }
        {
          "if" = {
            app-id = "company.thebrowser.Browser";
          };
          check-further-callbacks = true;
          run = [
            "move-node-to-workspace A"
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
        alt-1 = "exec-and-forget open -a '1Password.app'; workspace 1";
        alt-a = "exec-and-forget open -a 'Arc.app'; workspace A";
        alt-shift-a = "exec-and-forget open -a 'qutebrowser.app'; workspace A";
        alt-b = "exec-and-forget open -a 'Brewfather.app'; workspace B";
        alt-c = "exec-and-forget open -a 'Google Calendar.app'; workspace C";
        alt-comma = "layout accordion horizontal vertical";
        alt-e = "exec-and-forget open -a 'Gmail.app'; workspace E";
        alt-equal = "resize smart +50";
        alt-f = "fullscreen on  --no-outer-gaps --fail-if-noop";
        alt-g = "exec-and-forget open -a 'GitHub.app'; workspace G";
        alt-h = "focus left";
        alt-i = "exec-and-forget open -a 'Jira.app'; workspace I";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";
        alt-m = "exec-and-forget open -a 'Google Meet.app'; workspace M";
        alt-minus = "resize smart -50";
        alt-p = "exec-and-forget open -a 'GCP.app'; workspace P";
        alt-q = "exec-and-forget open -a /Applications/Ghostty.app; workspace Q";
        alt-s = "exec-and-forget open -a /Applications/Slack.app; workspace S";
        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";
        alt-shift-semicolon = "mode service";
        alt-slash = "layout tiles horizontal vertical";
        alt-t = "exec-and-forget open -a 'YouTube Music.app'; workspace T";
        alt-tab = "workspace-back-and-forth";
        alt-y = "exec-and-forget open -a 'YouTube.app'; workspace Y";
        cmd-alt-h = [];
        cmd-h = [];
        cmd-tab = [];
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
