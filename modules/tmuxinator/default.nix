{config, ...}: {
  home.sessionVariables = {
    TMUXINATOR_CONFIG = "${config.home.homeDirectory}/.config/tmuxinator";
  };
  home.file."/.config/tmuxinator" = {
    source = ./tmuxinator;
    recursive = true;
  };
}
