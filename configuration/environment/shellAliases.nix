{pkgs, ...}: {
  environment.
    shellAliases =
    {
      build = "nixos-rebuild switch --flake ~/dotfiles/#server";
      update = "nix flake update --flake ~/dotfiles";
      cat = "bat";
      ls = "ls -la";
    }
    // (pkgs.lib.optionalAttrs pkgs.stdenv.isDarwin {
      build = "sudo darwin-rebuild switch --flake ~/dotfiles/#work-laptop";
      update = "NIX_SSL_CERT_FILE=\"$HOME/certs/combined-ca-bundle.crt\" nix flake update --flake ~/dotfiles";
    });
}
