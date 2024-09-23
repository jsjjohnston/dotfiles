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
    };
  };
}
