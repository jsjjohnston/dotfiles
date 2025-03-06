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
      example-key = {
      };
      gitConfigEmail = {
        key = "gitConfigEmail"; # YAML key to decrypt (from secrets.yaml)
        path = "${config.home.homeDirectory}/.config/sops/secrets/git-email.gitconfig"; # runtime output path (temp dir at activation)&#8203;:contentReference[oaicite:4]{index=4}
      };
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
                columns: [32, 32, 32, 32, 32]
                rows: [10, 10, 10, 4, 4, 90]
              refreshInterval: 1
              mods:
                digitalclock:
                  color: orange
                  enabled: true
                  font: bigfont
                  hourFormat: 12
                  position:
                    top: 0
                    left: 1
                    height: 1
                    width: 1
                  refreshInterval: 1s
                  type: "digitalclock"
                  title: "${config.sops.placeholder.example-key}"
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
                    left: 2
                    height: 1
                    width: 2
                  refreshInterval: 15
                  sort: "alphabetical"
                  title: "AUS Times"
                  type: "clocks"
                hackernews:
                  enabled: true
                  numberOfStories: 10
                  position:
                    top: 2
                    left: 1
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
                    top: 3
                    left: 3
                    height: 2
                    width: 1
                  refreshInterval: 150
                power:
                  enabled: true
                  position:
                    top: 3
                    left: 2
                    height: 1
                    width: 1
                  refreshInterval: 15
                  title: "⚡️"
                uptime:
                  args: [""]
                  cmd: "uptime"
                  enabled: true
                  position:
                    top: 4
                    left: 1
                    height: 1
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
    # Please read the comment before changing.
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
