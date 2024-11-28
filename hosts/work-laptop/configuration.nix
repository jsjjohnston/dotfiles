{
  pkgs,
  ...
}:
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
  ];

  environment.shellAliases = {
    ll = "ls -la";
    build = "darwin-rebuild switch --flake ~/dotfiles/hosts/work-laptop/#work-laptop";
    cat = "bat";
    gh-deploy = "gh workflow run `git branch --show-current`";
  };

  users.users.jay = {
    home = "/Users/jay";
  };

  nix.settings.ssl-cert-file = "/etc/nix/ca_cert.pem";
  security.pki.certificates = [
    "/etc/nix/ca_cert.pem"
  ];

  homebrew = {
    enable = true;
    brews =
      [
      ];
  };
  nixpkgs.config.allowUnfree = true;

  nix.settings.trusted-users = [
    "root"
    "jay"
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
  # };

  services.aerospace = {
    enable = false;
  };
  services.yabai = {
    enable = false;
    config = {
      layout = "bsp";
      auto_balance = true;
      window_opacity = true;
      active_window_opacity = 1.0;
      normal_window_opacity = 0.5;
    };
  };

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.zsh.enable = true; # default shell on catalina

  system.stateVersion = 5;
}
