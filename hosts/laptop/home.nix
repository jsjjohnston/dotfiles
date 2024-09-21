{
  pkgs,
  inputs,
  ...
}: {
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

  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
        inputs.anyrun.packages.${pkgs.system}.applications
        # inputs.anyrun.packages.${pkgs.system}.symbols
        # inputs.anyrun.packages.${pkgs.system}.rink
        # inputs.anyrun.packages.${pkgs.system}.shell
        # inputs.anyrun.packages.${pkgs.system}.translate
        # inputs.anyrun.packages.${pkgs.system}.kidex
        # inputs.anyrun.packages.${pkgs.system}.randr
        # inputs.anyrun.packages.${pkgs.system}.stdin
        # inputs.anyrun.packages.${pkgs.system}.dictionary
        # inputs.anyrun.packages.${pkgs.system}.websearch
      ];
      x = {fraction = 0.5;};
      y = {fraction = 0.5;};
      # width = {fraction = 0.3;};
      width = {absolute = 800;};
      height = {absolute = 40;};
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;
    };
    extraCss = ''
             window {
        		background: transparent;
             }
      list#main
      {
      	background-color: red;
      }
    '';

    extraConfigFiles."some-plugin.ron".text = ''
      #     Config(
      #       // for any other plugin
      #       // this file will be put in ~/.config/anyrun/some-plugin.ron
      #       // refer to docs of xdg.configFile for available options
      #     )
      #   '';
  };

  programs.wofi = {
    enable = true;
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
