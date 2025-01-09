{
  pkgs,
  config,
  ...
}:
let
  gdk = pkgs.google-cloud-sdk.withExtraComponents (
    with pkgs.google-cloud-sdk.components;
    [
      gke-gcloud-auth-plugin
    ]
  );

in
{
  environment.systemPackages = with pkgs; [
    terraform
    awscli2
    aws-vault
    bat
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
    gdk
    bruno
    bruno-cli
    nixd
    nil
    bash
  ];

  environment.shellAliases = {
    ll = "ls -la";
    build = "darwin-rebuild switch --flake ~/dotfiles/hosts/work-laptop/#work-laptop";
    update = "nix flake update --flake ~/dotfiles/hosts/work-laptop/";
    cat = "bat";
    gh-deploy = "gh workflow run --ref=`git branch --show-current`";
  };

  system.activationScripts."ssl-ca-cert-fix".text = ''
    if [ ! -f /etc/nix/ca_cert.pem ]; then
      security export -t certs -f pemseq -k /Library/Keychains/System.keychain -o /tmp/certs-system.pem
      security export -t certs -f pemseq -k /System/Library/Keychains/SystemRootCertificates.keychain -o /tmp/certs-root.pem
      cat /tmp/certs-root.pem /tmp/certs-system.pem > /tmp/ca_cert.pem
      sudo mv /tmp/ca_cert.pem /etc/nix/
    fi
  '';

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
  nix.linux-builder.enable = true;

  # TODO: Review default mac settings
  # system.defaults = {
  #   dock.autohide = true;
  #   dock.mru-spaces = false;
  #   finder.AppleShowAllExtensions = true;
  #   finder.FXPreferredViewStyle = "clmv";
  #   loginwindow.LoginwindowText = "nixcademy.com";
  #   screencapture.location = "~/Pictures/screenshots";
  #   screensaver.askForPasswordDelay = 10;
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

  # programs.tmux = {
  #   enable = true;
  #   enableFzf = true;
  #   enableVim = true;
  #   enableSensible = true;
  # };

  services.yabai = {
    enable = true;
    config = {
      menubar_opacity = 1.0;
      mouse_follows_focus = false;
      focus_follows_mouse = false;
      display_arrangement_order = "default";
      window_origin_display = "default";
      window_placement = "second_child";
      window_insertion_point = "focused";
      window_animation_duration = 0.0;
      window_animation_easing = "ease_out_circ";
      window_opacity_duration = 0.0;
      active_window_opacity = 1.0;
      normal_window_opacity = 0.9;
      window_opacity = true;
      insert_feedback_color = "0xffd75f5f";
      split_ratio = 0.50;
      split_type = "auto";
      auto_balance = true;
      top_padding = 12;
      bottom_padding = 12;
      left_padding = 12;
      right_padding = 12;

      window_gap = 6;
      mouse_modifier = "fn";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action = "swap";
      window_zoom_persist = true;
      window_shadow = true;
      layout = "bsp";
    };
  };
  services.skhd = {
    enable = true;
    skhdConfig = ''
      alt - j : yabai -m window --focus stack.next
      alt - k : yabai -m window --focus stack.prev
      cmd + shift - s : open /System/Applications/Utilities/Screenshot.app
    '';

  };
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.zsh.enable = true; # default shell on catalina

  # programs.bash = {
  #
  #   enable = true;
  # };
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 5;
}
