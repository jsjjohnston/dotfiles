{
  imports = [
    ./homebrew.nix
    ./system
  ];
  system = {
    startup.chime = false;
  };
}
