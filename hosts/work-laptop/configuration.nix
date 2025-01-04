{
  pkgs,
  inputs,
  ...
}:
let
  gdk = pkgs.google-cloud-sdk.withExtraComponents (
    with pkgs.google-cloud-sdk.components;
    [
      gke-gcloud-auth-plugin
      # config-connector
      # beta
    ]
  );

in
{
  environment.systemPackages = with pkgs; [
    terraform
    awscli2
    aws-vault
    bat
    docker
    podman
    jq
    ripgrep
    typescript-language-server
    vscode-langservers-extracted
    yazi
    lazygit
    terraform-ls
    delta
    jira-cli-go
    eslint_d
    typescript
    python39
    terraform
    gdk
    bruno
    bruno-cli
    nixd
    nil
  ];

  environment.shellAliases = {
    ll = "ls -la";
    build = "darwin-rebuild switch --flake ~/dotfiles/hosts/work-laptop/#work-laptop";
    update = "nix flake update --flake ~/dotfiles/hosts/work-laptop/";
    cat = "bat";
    gh-deploy = "gh workflow run `git branch --show-current`";
  };

  system.activationScripts."ssl-ca-cert-fix".text = ''
    if [ ! -f /etc/nix/ca_cert.pem ]; then
      security export -t certs -f pemseq -k /Library/Keychains/System.keychain -o /tmp/certs-system.pem
      security export -t certs -f pemseq -k /System/Library/Keychains/SystemRootCertificates.keychain -o /tmp/certs-root.pem
      cat /tmp/certs-root.pem /tmp/certs-system.pem > /tmp/ca_cert.pem
      sudo mv /tmp/ca_cert.pem /etc/nix/
    fi
  '';

  system.activationScripts."bashshell".text = ''
    chsh -s ${pkgs.bash}/bin/zsh
  '';

  # This is the main part
  nix.settings = {
    ssl-cert-file = "/etc/nix/ca_cert.pem";
  };
  security.pki.certificates = [
    "/etc/nix/ca_cert.pem"
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
    brews = [
    ];
    casks = [
      {
        name = "lookaway";
        greedy = true;
      }
      {
        name = "ghostty";
      }
      {
        name = "docker";
      }
      # {
      #   name = "1password";
      #   greedy = true;
      # }
      # {
      #   name = "1password-cli";
      #   greedy = true;
      # }

    ];
  };

  # power = {
  #   restartAfterFreeze = true;
  #   restartAfterPowerFailure = true;
  #   sleep = {
  #     computer = 30;
  #     display = 20;
  #     harddisk = 25;
  #   };
  # };

  programs.direnv = {
    enable = true;
  };
  nixpkgs.config.allowUnfree = true;

  nix.settings.trusted-users = [
    "root"
    "jay"
    "@wheel"
  ];

  nix.gc = {
    automatic = true;
    interval = {
      Hour = 13;
      Minute = 15;
      Weekday = 3;
    };
    options = "--max-freed $((64 * 1024**3))";
    user = "jay";
  };

  nix.optimise = {
    automatic = true;
    interval = {
      Hour = 12;
      Minute = 15;
      Weekday = 4;
    };
    user = "jay";
  };

  # TODO: Learn Tmux
  # programs.tmux = {
  #   enable = true;
  #   enableFzf = true;
  #   enableVim = true;
  #   enableSensible = true;
  # };

  services.aerospace = {
    enable = false;
  };
  services.yabai = {
    enable = false;
    config = {
      layout = "bsp";
      auto_balance = true;
      window_opacity = "on";
      active_window_opacity = 1.0;
      normal_window_opacity = 0.5;
      window_placement = "second_child";
      window_gap = 10;
    };
  };
  services.skhd = {
    enable = false;
    skhdConfig = ''
      alt - j : yabai -m window --focus stack.next
      alt - k : yabai -m window --focus stack.prev
      cmd + shift - s : open /System/Applications/Utilities/Screenshot.app
    '';

  };
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.zsh.enable = true; # default shell on catalina
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 5;
}
