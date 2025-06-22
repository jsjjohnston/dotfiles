{
  programs.qutebrowser.settings.colors = {
    fg = "#cdd6f4";
    completion = {
      category = {
        fg = "#ffffff";
        bg = "#2b2d42";
        border = {
          bottom = "#2b2d42";
          top = "#2b2d42";
        };
      };
      even = {
        bg = "#1a1a2e";
      };
      item = {
        selected = {
          bg = "e8c000";
          border = {
            bottom = "bbbb00";
            top = "bbbb00";
          };
          fg = "black";
          match = {
            fg = "ff4444";
          };
        };
      };
      match = {
        fg = "#89b4fa";
      };
      odd = {
        bg = "#1e1e2e";
      };
      scrollbar = {
        bg = "#1e1e2e";
        fg = "#89b4fa";
      };
    };
    contextmenu = {
      disabled = {
        bg = "empty";
        fg = "empty";
      };
      menu = {
        bg = "empty";
        fg = "empty";
      };
      selected = {
        bg = "empty";
        fg = "empty";
      };
    };
    downloads = {
      bar = {
        bg = "#1e1e2e";
      };
      error = {
        bg = "#f38ba8";
        fg = "red";
      };
      start = {
        bg = "#89b4fa";
        fg = "#000000";
      };
      stop = {
        bg = "#94e2d5";
        fg = "#000000";
      };
      system = {
        bg = "rgb";
        fg = "rgb";
      };
    };
    hints = {
      bg = "#2b2d42";
      fg = "#ffffff";
      match = {
        fg = "#89b4fa";
      };
    };
    keyhint = {
      bg = "rgba(0, 0, 0, 80%)";
      fg = "FFFFFF";
      suffix = {
        fg = "FFFF00";
      };
    };
    messages = {
      error = {
        bg = "#f38ba8";
        border = "bb0000";
        fg = "white";
      };
      info = {
        bg = "#1e1e2e";
        fg = "#cdd6f4";
        border = "333333";
      };
      warning = {
        bg = "#f9e2af";
        border = "d47300";
        fg = "black";
      };
    };
    prompts = {
      bg = "#1e1e2e";
      border = "1px solid #89b4fa";
      fg = "#cdd6f4";
      selected = {
        bg = "grey";
        fg = "white";
      };
    };
    statusbar = {
      caret = {
        bg = "purple";
        fg = "white";
        selection = {
          bg = "a12dff";
          fg = "white";
        };
      };
      command = {
        bg = "#1a1a2e";
        fg = "#89b4fa";
        private = {
          bg = "darkslategray";
          fg = "white";
        };
      };
      insert = {
        bg = "#2b2d42";
        fg = "#ffffff";
      };
      normal = {
        bg = "#1e1e2e";
        fg = "#cdd6f4";
      };
      passthrough = {
        bg = "darkblue";
        fg = "white";
      };
      private = {
        bg = "666666";
        fg = "white";
      };
      progress = {
        bg = "white";
      };
      url = {
        error = {
          fg = "#f38ba8";
        };
        fg = "#89b4fa";
        hover = {
          fg = "aqua";
        };
        success = {
          http = {
            fg = "#a6e3a1";
          };
          https = {
            fg = "#94e2d5";
          };
        };
        warn = {
          fg = "yellow";
        };
      };
    };
    tabs = {
      fg = "#cdd6f4";
      bar = {
        bg = "#1e1e2e";
      };
      even = {
        bg = "#1e1e2e";
        fg = "white";
      };
      indicator = {
        error = "ff0000";
        start = "0000aa";
        stop = "00aa00";
        system = "rgb";
      };
      odd = {
        bg = "#1a1a2e";
        fg = "white";
      };
      pinned = {
        even = {
          bg = "darkseagreen";
          fg = "white";
        };
        odd = {
          bg = "seagreen";
          fg = "white";
        };
        selected = {
          even = {
            bg = "#2b2d42";
            fg = "#ffffff";
          };
          odd = {
            bg = "#2b2d42";
            fg = "#ffffff";
          };
        };
      };
      selected = {
        even = {
          fg = "white";
        };
        odd = {
          bg = "black";
          fg = "white";
        };
      };
    };
    tooltip = {
      bg = "empty";
      fg = "empty";
    };

    webpage = {
      bg = "#0f0f1a";
      darkmode = {
        algorithm = "lightness-cielab";
        contrast = 0.0;
        enabled = true;
        policy = {
          images = "smart";
          page = "smart";
        };
        threshold = {
          background = 0;
          foreground = 256;
        };
      };
      preferred_color_scheme = "dark";
    };
  };
}
