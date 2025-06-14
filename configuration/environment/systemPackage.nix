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
        # qutebrowser
        astroterm
        yarn
        bash-preexec
        mtr
        fd
        bat
        btop
        caligula
        clipse
        cloudflared
        delta
        dig
        drawio
        eslint_d
        ffmpeg
        git-credential-manager
        google-chrome
        jq
        killall
        lazycli
        lazygit
        libnotify
        most
        ncdu
        nil
        nixd
        parallel-full
        pastel
        proselint
        pv
        ripgrep
        rsync
        shellcheck
        slack
        sops
        sqlfluff
        statix
        tealdeer
        terraform
        terraform-ls
        tmuxinator
        tree-sitter
        typescript
        typescript-language-server
        unixtools.watch
        uutils-coreutils
        vale
        vtsls
        wikiman
        wtfutil
        xarchiver
        xh
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
      ++ lib.optionals pkgs.stdenv.isLinux [
        dysk
      ];
  };
}
