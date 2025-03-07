{config, ...}: {
  imports = [
    ../../modules/fzf
    ../../modules/ghostty
    ../../modules/git
    ../../modules/github
    ../../modules/java
    ../../modules/lazygit
    ../../modules/nixvim
    ../../modules/nvf
    ../../modules/oh-my-posh
    ../../modules/shell/bash
    ../../modules/shell/zsh
    ../../modules/tmux
    ../../modules/zoxide
    ../../modules/starship
    ../../modules/yazi
  ];
  sops = {
    defaultSopsFile = ../../secrets/secret.yaml;
    age.keyFile = "/Users/jay/.config/sops/age/keys.txt";
    secrets = {
      gitConfigEmail = {
        key = "gitConfigEmail";
        path = "${config.home.homeDirectory}/.config/git/git-email.gitconfig";
      };
      "jira/api_key" = {};
      "jira/domain" = {};
      "jira/domain" = {};
      "jira/email" = {};
      "jira/project" = {};
      "jira/username" = {};
    };
    templates = {
      wtf = {
        content =
          /*
          yaml
          */
          ''
            wtf:
              colors:
                border:
                  focusable: darkslateblue
                  focused: orange
                  normal: gray
              grid:
                columns: [32, 32, 32, 32]
                rows: [10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
              refreshInterval: 1
              mods:
                jira:
                  apiKey: "${config.sops.placeholder."jira/api_key"}"
                  colors:
                    rows:
                      even: "lightblue"
                      odd: "white"
                  domain: "${config.sops.placeholder."jira/domain"}"
                  email: "${config.sops.placeholder."jira/email"}"
                  enabled: true
                  jql: "sprint in openSprints()"
                  position:
                    top: 0
                    left: 0
                    height: 1
                    width: 2
                  project: ["${config.sops.placeholder."jira/project"}"]
                  refreshInterval: 15m
                  username: "${config.sops.placeholder."jira/username"}"
                  verifyServerCertificate: true
                digitalclock:
                  color: orange
                  enabled: true
                  font: bigfont
                  hourFormat: 12
                  position:
                    top: 0
                    left: 2
                    height: 1
                    width: 1
                  refreshInterval: 1s
                  type: "digitalclock"
                  title: "Time"
                clocks:
                  colors:
                    rows:
                      even: "lightblue"
                      odd: "white"
                  enabled: true
                  locations:
                    Adelaide: "Australia/Adelaide"
                    Brisbane: "Australia/Queensland"
                    Hobart: "Australia/Tasmania"
                    Perth: "Australia/West"
                    Sydney: "Australia/NSW"
                  position:
                    top: 0
                    left: 3
                    height: 1
                    width: 1
                  refreshInterval: 15
                  sort: "alphabetical"
                  title: "AUS Times"
                  type: "clocks"
                hackernews:
                  enabled: true
                  numberOfStories: 10
                  position:
                    top: 1
                    left: 2
                    height: 1
                    width: 2
                  storyType: top
                  refreshInterval: 1h
                ipinfo:
                  colors:
                    name: "lightblue"
                    value: "white"
                  enabled: true
                  position:
                    top: 4
                    left: 0
                    height: 7
                    width: 1
                  refreshInterval: 150
                power:
                  enabled: true
                  position:
                    top: 4
                    left: 3
                    height: 7
                    width: 1
                  refreshInterval: 15
                  title: "⚡️"
                uptime:
                  args: [""]
                  cmd: "uptime"
                  enabled: true
                  position:
                    top: 8
                    left: 1
                    height: 3
                    width: 2
                  refreshInterval: 30
                  type: cmdrunner
          '';
        path = "${config.home.homeDirectory}/.config/wtf/config.yml";
      };
    };
  };

  home = {
    username = "jay";
    homeDirectory = "/Users/jay";
    sessionPath = [
      "/opt/homebrew/bin"
    ];
    sessionVariables = {
      XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    };
    # Please read the comment before changing.
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
