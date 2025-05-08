{system, ...}: let
  optimiseModule =
    if system == "aarch64-darwin" || system == "x86_64-darwin"
    then ./darwin.nix
    else ./linux.nix;
in {
  imports = [optimiseModule];
}
