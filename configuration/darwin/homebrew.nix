{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
    casks = [
      {
        name = "1password";
      }
      {
        name = "1password-cli";
      }
      {
        name = "lookaway";
        greedy = true;
      }
      {
        name = "ghostty";
      }
      # {
      #   name = "qutebrowser";
      # }
      {
        name = "docker";
      }
    ];
  };
}
