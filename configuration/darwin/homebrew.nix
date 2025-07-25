{
  homebrew = {
    enable = true;
    global.brewfile = false;

    onActivation = {
      autoUpdate = true;
      cleanup = "none";
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
        name = "raycast";
      }
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
        name = "karabiner-elements";
      }
    ];
  };
}
