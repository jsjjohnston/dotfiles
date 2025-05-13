{pkgs, ...}: {
  programs.rofi = {
    enable = true;

    rofiConfig = ''
      show-icons: true
      icon-theme: Papirus
      font: Iosevka 12

      width: 50
      lines: 10
      columns: 1
      location: 2
      window-margin: 15
      element-padding: 5
      separator-style: none

      window-opacity: 90
      element-opacity: 100

      modi: "run,drun,window,ssh,combi"
      fuzzy: true
      case-sensitive: false
      matching-method: "fuzzy"
      token-limit: 2
      disable-history: true
      scroll-method: 1

      scrollbar-thickness: 6
      scrollbar-position: right

      color-window: "#2E3440, #4C566A, #D8DEE9"
      color-normal: "#2E3440, #D8DEE9, #D8DEE9, #3B4252, #D8DEE9"
      color-active: "#3B4252, #88C0D0, #88C0D0, #4C566A, #ECEFF4"
      color-urgent: "#BF616A, #ECEFF4, #ECEFF4, #BF616A, #ECEFF4"

      ssh-command: "ssh -i ~/.ssh/id_rsa {host}"

      terminal: "alacritty -e"

      combi-modi: "window,run"
    '';

    themes = {
      nord = ./rofi-nord.rasi;
      gruvbox = ./rofi-gruvbox.rasi;
      "rose-pine" = ./rofi-rose-pine.rasi;
    };
    theme = "rose-pine";

    extraScripts = {
      power = {
        description = "Power Menu";
        command = "${pkgs.rofi-power-menu}/bin/rofi-power-menu";
      };
      calc = {
        description = "Calculator";
        command = "${pkgs.rofi-calc}/bin/rofi-calc";
      };
      network = {
        description = "Wi-Fi Selector";
        command = "${pkgs.rofi-wifi-menu}/bin/rofi-wifi-menu";
      };
    };

    keybindings = {
      rofiRun = "M-p";
      rofiDrun = "M-<Space>";
      rofiWindow = "M-Tab";
      rofiCombi = "M-c";
      rofiSSH = "M-s";
    };
  };
}
