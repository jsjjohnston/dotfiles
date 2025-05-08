{
  pkgs,
  inputs,
  ...
}: {
  programs.anyrun = {
    enable = false;
    config = {
      plugins = [
        inputs.anyrun.packages.${pkgs.system}.applications
      ];
      x = {fraction = 0.5;};
      y = {fraction = 0.3;};
      width = {fraction = 0.3;};
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;
    };
    extraCss =
      /*
      css
      */
      ''
        entry {
          background-color: #f0f0f0;
          color: #333333;
          font-size: 14px;
          padding: 5px;
          border-radius: 4px;
          }

        window {
                         background: transparent;
                         border: 2px solid #cccccc;
                        border-radius: 10px;
                    }

                .main GtkListBox {
                  background-color: #eaeaea;
                  padding: 10px;
                  margin: 5px;
                  border-radius: 5px;
              }

              /* Styling the box combining the main list and the entry box */
        .main GtkBox {
            background-color: #dcdcdc;
            border: 1px solid #bbbbbb;
            padding: 10px;
        }

        /* Styling the entire plugin */
        .plugin GtkLabel {
            color: #555555;
            font-weight: bold;
            margin: 5px 0;
        }

        /* Styling the plugin boxes */
        .plugin GtkBox {
            background-color: #f9f9f9;
            padding: 10px;
            margin: 5px;
            border-radius: 5px;
        }

        /* Styling the plugin icon */
        .plugin GtkImage {
            margin-right: 10px;
        }

        /* Styling a specific match */
        .match GtkBox {
            background-color: #f7f7f7;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #dddddd;
        }

        /* Styling the match icon */
        .match GtkImage {
            margin-right: 5px;
        }

        /* Styling the title of the match */
        .match-title GtkLabel {
            color: #333333;
            font-weight: bold;
            font-size: 16px;
        }

        /* Styling the description of the match */
        .match-desc GtkLabel {
            color: #666666;
            font-size: 14px;
            margin-top: 5px;
        }
      '';
  };
}
