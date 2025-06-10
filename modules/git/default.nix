{config, ...}: {
  home.file.".local/bin/git-worktree-session" = {
    source = ./scripts/git-worktree-session.sh;
    executable = true;
  };

  home.file.".local/bin/git-clone-bare" = {
    source = ./scripts/git-clone-bare.sh;
    executable = true;
  };
  programs.git = {
    enable = true;
    userName = "Jay Johnston";
    userEmail = "jsjjohnston@gmail.com";
    # includes = [
    #   {inherit (config.sops.secrets.gitConfigEmail) path;}
    # ];
    lfs.enable = true;
    extraConfig = {
      advice = {
        skippedCherryPicks = false;
      };
      core = {
        editor = "nvim";
        pager = "delta";
      };
      push = {
        autoSetupRemote = true;
      };
      pull = {
        rebase = true;
      };
      rerere = {
        enable = true;
      };
      gc = {
        worktreePruneExpire = "now";
      };
      merge = {
        conflictstyle = "zdiff3";
      };
      mergetool = {
        keepBackup = false;
        prompt = false;
        nvim.cmd = "nvim -d -c 'wincmd l' -c 'norm ]c' \"$LOCAL\" \"$MERGED\" \"$REMOTE\"";
      };

      alias = {
      };
      rebase = {
        autoSquash = true;
        autoStash = true;
        missingCommitsCheck = "error";
        updateRefs = true;
      };
      init = {
        defaultBranch = "main";
      };
      commit.verbose = true;
      help.autoCorrect = 10;
      diff = {
        algorithm = "histogram";
        submodule = "log";
        colorMovedWS = "allow-indentation-change";
        colorMoved = "default";
        context = 10;
      };
      transfer.fsckobjects = true;
      fetch = {
        fsckobjects = true;
        prune = true;
      };
      receive.fsckobjects = true;
      status.submoduleSummary = true;
      submodule.recurse = true;
      branch.sort = "-committerdate";
      tag.sort = "taggerdate";
      log.date = "iso";
      merge.tool = "nvim";
      # remote.origin.fetch = "+refs/heads/*:refs/remotes/origin/*";
    };
  };
}
