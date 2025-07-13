{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    bashrcExtra =
      /*
      bash
      */
      ''
        export NODE_EXTRA_CA_CERTS="$HOME/certs/combined-ca-bundle.crt"
        `test -z "$TMUX" && sesh cn dotfiles`
        NIX_PATHS="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:"
        NEWPATH=''${PATH/$NIX_PATHS}
        while [[ $NEWPATH =~ $NIX_PATHS ]]; do
          PATH=$NEWPATH
          NEWPATH=''${NEWPATH/$NIX_PATHS}
        done
        bind TAB:menu-complete
        source /Users/jay/.config/op/plugins.sh
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

    profileExtra = "source /opt/montu-kandji/netskope-cli-certificate-fix.sh";
  };
}
