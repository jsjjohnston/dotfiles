{config, ...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    bashrcExtra =
      /*
      bash
      */
      ''
          `test -z "$TMUX" && (tmux attach || tmux new-session)`
          NIX_PATHS="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:"
          NEWPATH=''${PATH/$NIX_PATHS}
          while [[ $NEWPATH =~ $NIX_PATHS ]]; do
            PATH=$NEWPATH
            NEWPATH=''${NEWPATH/$NIX_PATHS}
          done
          bind TAB:menu-complete
          source /Users/jay/.config/op/plugins.sh

        # sudo() {
        #   if command sudo -l | grep -q "timestamp_timeout=0"; then
        #     command sudo visudo
        #   else
        #     command sudo "$@"
        #   fi
        # }

      '';
    historySize = 100000;
    historyIgnore = [
      "exit"
    ];
    shellOptions = [
      "autocd"
      "cdspell"
      "checkwinsize"
      "complete_fullquote"
      "dirspell"
      "dotglob"
      "globstar"
      "histappend"
      "hostcomplete"
      "interactive_comments"
      "promptvars"
    ];
  };
}
