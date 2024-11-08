{
  config,
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
    nodePackages_latest.aws-cdk
    yazi
    lazygit
    terraform-ls
    delta
  ];

  environment.shellAliases = {
    ll = "ls -la";
    build = "darwin-rebuild switch --flake ~/dotfiles/hosts/work-laptop/#work-laptop";
    cat = "bat";
    gh-deploy = "gh workflow run `git branch --show-current`";
  };

  # programs.bash.enable = true;

  users.users.jay = {
    home = "/Users/jay";
  };

  nix.settings.ssl-cert-file = "/etc/nix/ca_cert.pem";
  security.pki.certificates = [
    "/etc/nix/ca_cert.pem"
  ];

  homebrew = {
    enable = true;
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

  nix.settings.auto-optimise-store = true;

  # programs.tmux = {
  #   enable = true;
  #   enableFzf = true;
  #   enableVim = true;
  # };

  services.aerospace = {
    enable = false;
  };

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.zsh.enable = true; # default shell on catalina

  system.stateVersion = 5;
}
