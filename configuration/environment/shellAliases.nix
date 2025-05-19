{pkgs, ...}: {
  environment.
    shellAliases =
    {
      build = "nixos-rebuild switch --flake ~/dotfiles/#server";
      update = "nix flake update --flake ~/dotfiles";
      cat = "bat";
      ls = "ls -la";
      gh-deploy = "gh workflow run --ref=`git branch --show-current`";
    }
    // (pkgs.lib.optionalAttrs pkgs.stdenv.isDarwin {
      build = "sudo darwin-rebuild switch --flake ~/dotfiles/#work-laptop";
    });
}
