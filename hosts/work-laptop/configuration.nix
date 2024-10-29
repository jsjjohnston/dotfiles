{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    terraform
    awscli2
    aws-vault
    nodejs_18
    bat
    yarn
    docker
    podman
    jq
    ripgrep
    typescript-language-server
  ];

  environment.shellAliases = {
    ll = "ls -la";
    build = "darwin-rebuild switch --flake ~/dotfiles/hosts/work-laptop/#work-laptop --impure";
  };

  users.users.jay = {
    home = "/Users/jay";
  };

  nix.settings.ssl-cert-file = "/etc/ssl/certs/zscaler.crt";
  security.pki.certificates = [
    "/etc/ssl/certs/zscaler.crt"
  ];

  homebrew.enable = true;
  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;
    interval = {
      Hour = 13;
      Minute = 15;
      Weekday = 3;
    };
    options = "--max-freed $((64 * 1024**3))";
  };

  nix.optimise = {
    automatic = true;
    interval = {
      Hour = 12;
      Minute = 15;
      Weekday = 4;
    };
  };

  nix.settings.auto-optimise-store = true;

  programs.bash = {
    enable = true;
    completion.enable = true;
  };

  programs.tmux = {
    enable = true;
    enableFzf = true;
    enableVim = true;
  };

  services.aerospace = {
    enable = true;
  };

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.zsh.enable = true; # default shell on catalina

  system.stateVersion = 5;
}
