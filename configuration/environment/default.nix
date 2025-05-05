{
  pkgs,
  config,
  ...
}: let
  gdk = pkgs.google-cloud-sdk.withExtraComponents (
    with pkgs.google-cloud-sdk.components; [
      gke-gcloud-auth-plugin
    ]
  );
in {
  environment = {
    systemPackages =
      with pkgs;
        [
          bash-preexec
          bat
          dig
          clipse
          cloudflared
          delta
          drawio
          eslint_d
          ffmpeg
          git-credential-manager
          google-chrome
          jq
          btop
          ncdu
          killall
          lazycli
          lazygit
          libnotify
          ncdu
          nil
          nixd
          parallel-full
          pv
          ripgrep
          slack
          sops
          statix
          vale
          shellcheck
          sqlfluff
          tree-sitter
          terraform
          terraform-ls
          tmuxinator
          typescript
          typescript-language-server
          unixtools.watch
          wtfutil
          xarchiver
          youtube-music
          yq-go
        ]
        ++ lib.optionals pkgs.stdenv.isDarwin [
          arc-browser
          aws-vault
          awscli2
          gdk
        ]
        ++ lib.optionals (config.programs.hyprland.enable or false) [
          swww
          waybar
          hyprpaper
          dunst
          sddm-sugar-dark
        ]
      # ++ lib.optionals pkgs.stdenv.isLinux [
      # ]
      ;

    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    shellAliases =
      {
        build = "sudo nixos-rebuild switch --flake ~/dotfiles/#server";
        update = "nix flake update --flake ~/dotfiles";
        cat = "bat";
        ls = "ls -la";
        gh-deploy = "gh workflow run --ref=`git branch --show-current`";
      }
      // (pkgs.lib.optionalAttrs pkgs.stdenv.isDarwin {
        build = "darwin-rebuild switch --flake ~/dotfiles/#work-laptop";
      });

    shells = [pkgs.bashInteractive];
  };
}
