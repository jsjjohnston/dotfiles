{
  pkgs,
  inputs,
  ...
}: {
  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
        inputs.anyrun.packages.${pkgs.system}.applications
        inputs.anyrun.packages.${pkgs.system}.ssh
        inputs.anyrun.packages.${pkgs.system}.docker
        inputs.anyrun.packages.${pkgs.system}.git
        inputs.anyrun.packages.${pkgs.system}.commands
        inputs.anyrun.packages.${pkgs.system}.bookmarks
        inputs.anyrun.packages.${pkgs.system}.history
        inputs.anyrun.packages.${pkgs.system}.kubernetes
        inputs.anyrun.packages.${pkgs.system}.awscli
        inputs.anyrun.packages.${pkgs.system}.gcloud
      ];

      x = {fraction = 0.5;};
      y = {fraction = 0.5;};
      width = {fraction = 0.4;};
      height = {fraction = 0.5;};

      minQueryLength = 2;
      fuzzyMatching = true;
      fuzzyThreshold = 0.7;
      caseSensitive = false;
      showResultsImmediately = true;
      debounceTime = 150;
      highlightMatch = true;

      maxEntries = 15;
      closeOnClick = true;
      placeholder = "Type to search...";

      layer = "top";
      hotkey = "<Super>Space";
      iconSize = 24;

      animationDuration = 200;
      backgroundBlur = true;
      backgroundOpacity = 0.85;
      borderWidth = 2;
      borderColor = "var(--accent)";

      pluginConfigs = {
        git = {
          showBranch = true;
          showStatus = true;
        };
        docker = {showRunningOnly = false;};
      };

      cacheResults = true;
      cacheDuration = 300000;

      hidePluginInfo = true;
      hideIcons = false;
      ignoreExclusiveZones = false;
    };

    extraCss =
      /*
      css
      */
      ''
        :root {
          --bg-main:
          --bg-alt:
          --fg-main:
          --accent:
          --radius:    6px;
          --padding:   8px;
        }

        window {
          background: rgba(46,52,64,0.9);
          border: none;
          border-radius: var(--radius);
          box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        }

        entry {
          background: var(--bg-alt);
          color: var(--fg-main);
          font-family: "Fira Code", monospace;
          font-size: 14px;
          padding: var(--padding);
          border-radius: var(--radius);
          transition: background 0.2s ease;
        }
        entry:focus,
        entry:hover {
          background: var(--accent);
          color:
        }

        /* Alternating stripes */
        .match:nth-child(even) GtkBox {
          background: var(--bg-alt);
        }

        scrollbar {
          min-width: 6px;
          background: transparent;
        }
        scrollbar slider {
          background: var(--accent);
          border-radius: 3px;
        }
      '';
  };
}
