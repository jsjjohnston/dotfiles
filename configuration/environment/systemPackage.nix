{pkgs, ...}: let
  gdk = pkgs.google-cloud-sdk.withExtraComponents (
    with pkgs.google-cloud-sdk.components; [
      gke-gcloud-auth-plugin
    ]
  );
in {
  environment = {
    systemPackages = with pkgs;
      [
        bash-preexec
        bat
        dig
        clipse
        uutils-coreutils
        cloudflared
        delta
        drawio
        eslint_d
        ffmpeg
        git-credential-manager
        google-chrome
        gawkInteractive
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
        vtsls
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
        tealdeer
        wikiman
        rsync
        most
        proselint
        # qutebrowser
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
      ++ lib.optionals pkgs.stdenv.isLinux [
        dysk
      ];
  };
}
