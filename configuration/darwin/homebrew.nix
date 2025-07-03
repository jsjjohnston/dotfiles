{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
    brews = [
      {
        name = "cdktf";
      }
      {
        name = "node";
      }
    ];
    casks = [
      {
        name = "sol";
      }
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
      {
        name = "qutebrowser";
      }
    ];
  };
}
