{
  pkgs,
  pkgs-stable,
  ...
}: let
  gdk = pkgs.google-cloud-sdk.withExtraComponents (
    with pkgs.google-cloud-sdk.components; [
      gke-gcloud-auth-plugin
    ]
  );
in {
  environment = {
    systemPackages = with pkgs;
      [
        astroterm
        bash-preexec
        # bat
        # btop
        caligula
        clipse
        cloudflared
        delta
        dig
        drawio
        eslint_d
        # fd
        ffmpeg
        git-credential-manager
        # handlr-regex
        # jq
        killall
        lazycli
        lazygit
        libnotify
        most
        mtr
        ncdu
        nil
        nixd
        parallel-full
        pastel
        pkgs-stable.terraform
        pkgs-stable.terraform-ls
        proselint
        pv
        ripgrep
        rpg-cli
        rsync
        shellcheck
        slack
        sops
        sqlfluff
        statix
        tealdeer
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
        yarn
        youtube-music
        yq-go
      ]
      ++ lib.optionals pkgs.stdenv.isDarwin [
        arc-browser
        aws-vault
        awscli2
        chatgpt
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
