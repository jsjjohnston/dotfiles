{pkgs, ...}: {
  imports = [
    ../../modules/nixvim
    ../../modules/window-managers/hyprland.nix
    ../../modules/terminals/kitty
    ../../modules/git
  ];
  home.username = "jay";
  home.homeDirectory = "/home/jay";

  home.stateVersion = "24.05";

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
      hosts = [
        "https://github.com"
        "https://gist.github.com"
      ];
    };
  };
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    cycle = true;
    location = "center";
    pass = {};
    # plugins = [
    #   pkgs.rofi-calc
    #   pkgs.rofi-emoji
    #   pkgs.rofi-systemd
    # ];
    theme = {
      "*" = {
        background-color = "#2E3440";
        foreground-color = "#8FBCBB";
        text-color = "#8FBCBB";
        border-color = "#D8DEE9";
      };

      # Holds the entire window
      "#window" = {
        transparency = "real";
        background-color = "#2E3440";
        text-color = "#8FBCBB";
        border = "4px";
        border-color = "#D8DEE9";
        border-radius = "4px";
        width = "850px";
        padding = "15px";
      };

      # Wrapper around bar and results
      "#mainbox" = {
        background-color = "#2E3440";
        border = "0px";
        border-radius = "0px";
        border-color = "#D8DEE9";
        children = [
          "inputbar"
          "message"
          "listview"
        ];
        spacing = "10px";
        padding = "10px";
      };

      # Unknown
      "#textbox-prompt-colon" = {
        expand = false;
        str = ":";
        margin = "0px 0.3em 0em 0em";
        text-color = "#8FBCBB";
      };

      # Command prompt left of the input
      "#prompt" = {
        enabled = false;
      };

      # Actual text box
      "#entry" = {
        placeholder-color = "#4C566A";
        expand = true;
        horizontal-align = "0";
        placeholder = "";
        padding = "0px 0px 0px 5px";
        blink = true;
      };

      # Top bar
      "#inputbar" = {
        children = [
          "prompt"
          "entry"
        ];
        border = "1px";
        border-radius = "4px";
        padding = "6px";
      };

      # Results
      "#listview" = {
        background-color = "#2E3440";
        padding = "0px";
        columns = 1;
        lines = 12;
        spacing = "5px";
        cycle = true;
        dynamic = true;
        layout = "vertical";
      };

      # Each result
      "#element" = {
        orientation = "vertical";
        border-radius = "0px";
        padding = "5px 0px 5px 5px";
      };
      "#element.selected" = {
        border = "1px";
        border-radius = "4px";
        border-color = "#8FBCBB";
        background-color = "#D8DEE9";
        text-color = "#2E3440";
      };

      "#element-text" = {
        expand = true;
        # horizontal-align = mkLiteral "0.5";
        vertical-align = "0.5";
        margin = "0px 2.5px 0px 2.5px";
      };
      "#element-text.selected" = {
        background-color = "#D8DEE9";
        text-color = "#2E3440";
      };

      # Not sure how to get icons
      "#element-icon" = {
        size = "18px";
        border = "0px";
        padding = "2px 5px 2px 2px";
        background-color = "#2E3440";
      };
      "#element-icon.selected" = {
        background-color = "#D8DEE9";
        text-color = "#2E3440";
      };
    };
    xoffset = 0;
    yoffset = -20;
    extraConfig = {
      show-icons = true;
      kb-cancel = "Escape,Super+space";
      # modi = "window,drun,run,ssh,emoji,calc,systemd";
      modi = "window,drun,run,ssh";
      sort = true;
      # levenshtein-sort = true;
    };
  };

  home.packages = with pkgs; [
    zig
    gitAndTools.gh
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
