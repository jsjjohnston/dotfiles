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
  ];

  environment.shellAliases = {
    ll = "ls -la";
  };

  users.users.jay = {
    home = "/Users/jay";
  };

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

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.zsh.enable = true; # default shell on catalina

  system.stateVersion = 5;
}
