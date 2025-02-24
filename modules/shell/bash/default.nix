{...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    bashrcExtra = ''
      `test -z "$TMUX" && (tmux attach || tmux new-session)`
      NIX_PATHS="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:"
      NEWPATH=''${PATH/$NIX_PATHS}
      while [[ $NEWPATH =~ $NIX_PATHS ]]; do
        PATH=$NEWPATH
        NEWPATH=''${NEWPATH/$NIX_PATHS}
      done
    '';
  };
}
