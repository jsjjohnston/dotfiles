{...}: {
  programs.git = {
    enable = true;
    userName = "Jay Johnston";
    userEmail = "jsjjohnston@gmail.com";
    lfs.enable = true;
    extraConfig = {
      core = {editor = "nvim";};
      push = {autoSetupRemote = true;};
      pull = {rebase = true;};
      rerere = {enable = true;};
      gc = {worktreePruneExpire = "now";};
      merge = {conflictstyle = "zdiff3";};
      rebase = {
        autoSquash = true;
        autoStash = true;
      };
    };
  };
}
