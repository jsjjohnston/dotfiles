{
  nix = {
    gc = {
      automatic = true;
      interval = {
        Hour = 19;
        Minute = 00;
      };
      options = "--max-freed $((64 * 1024**3))";
    };
  };
}
