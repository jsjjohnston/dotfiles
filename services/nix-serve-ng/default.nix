{pkgs, ...}: {
  services.nix-serve = {
    enable = true;
    package = pkgs.nix-serve-ng;
    port = 5000;
    bindAddress = "0.0.0.0";
    secretKeyFile = "/etc/nix/key.secret";
  };
}
