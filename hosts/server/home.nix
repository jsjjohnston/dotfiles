{
  imports = [
    ../../modules/bat
    ../../modules/btop
    ../../modules/fd
    ../../modules/fzf
    ../../modules/ghostty
    ../../modules/git
    ../../modules/home-manager
    ../../modules/java
    ../../modules/jq
    ../../modules/lazygit
    ../../modules/k9s
    ../../modules/nvf
    ../../modules/shell/bash
    ../../modules/shell/zsh
    ../../modules/starship
    ../../modules/tmux
    ../../modules/tmuxinator
    ../../modules/yazi
    ../../modules/zoxide
  ];
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "w3m";
      };
    };
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
  };
}
