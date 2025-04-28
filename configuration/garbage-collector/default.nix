{
  nix = {
    gc = {
      automatic = true;
      # dates = "19:00"; # TODO: Handle conditions
      interval = {
        Hour = 19;
        Minute = 00;
      };
      options = "--max-freed $((64 * 1024**3))";
    };
  };
}
