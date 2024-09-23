{...}: {
  programs.git = {
    enable = true;
    userName = "Jay Johnston";
    userEmail = "jsjjohnston@gmail.com";
    lfs.enable = true;
    extraConfig = {
      core = {
        editor = "nvim";
        pager = "delta";
      };
      push = {autoSetupRemote = true;};
      pull = {rebase = true;};
      rerere = {enable = true;};
      gc = {worktreePruneExpire = "now";};
      merge = {conflictstyle = "zdiff3";};
      rebase = {
        autoSquash = true;
        autoStash = true;
        missingCommitsCheck = "error";
        updateRefs = true;
      };
      init = {defaultBranch = "main";};
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
    };
  };
}
