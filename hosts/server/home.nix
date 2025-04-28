{
  imports = [
    ../../modules/fzf
    ../../modules/ghostty
    ../../modules/git
    ../../modules/java
    ../../modules/lazygit
    ../../modules/nvf
    ../../modules/shell/bash
    ../../modules/shell/zsh
    ../../modules/starship
    ../../modules/tmux
    ../../modules/tmuxinator
    ../../modules/yazi
    ../../modules/zoxide
  ];
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "text/html" = "w3m";
  };
  home = {
    username = "jay";
    homeDirectory = "/home/jay";
    stateVersion = "24.11";
  };

  programs = {
    atuin = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        auto_sync = true;
        sync_frequency = "15s";
        sync_address = "http://127.0.0.1:8888";
        search_mode = "prefix";
      };
    };
    home-manager.enable = true;
  };
}
