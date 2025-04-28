{
  nix = {
    gc = {
      automatic = true;
      dates = "19:00";
      options = "--max-freed $((64 * 1024**3))";
    };
  };
}
