{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.terraform
    pkgs.awscli2
    pkgs.aws-vault
    pkgs.nodejs_18
    pkgs.bat
    pkgs.yarn
    pkgs.docker
    pkgs.podman
  ];

  users.users.jay = {
    home = "/Users/jay";
  };

  homebrew.enable = true;
  nixpkgs.config.allowUnfree = true;

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.zsh.enable = true; # default shell on catalina

  system.stateVersion = 5;
}
