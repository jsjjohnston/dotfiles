{
  imports = [
    ./ActivityMonitor.nix
    ./LaunchServices.nix
    ./NSGlobalDomain.nix
    ./SoftwareUpdate.nix
    ./WindowManager.nix
    ./alf.nix
    ./controlcenter.nix
    ./dock.nix
    ./finder.nix
    ./screencapture.nix
    ./trackpad.nix
  ];
  system = {
    startup.chime = false;
  };
}
