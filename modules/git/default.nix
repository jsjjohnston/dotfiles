{...}: {
  programs.git = {
    enable = true;
    userName = "Jay Johnston";
    userEmail = "jsjjohnston@gmail.com";
    lfs.enable = true;
    extraConfig = {
      push = {autoSetupRemote = true;};
    };
  };
}
