{...}: {
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true; # only on Darwin
  };
}
