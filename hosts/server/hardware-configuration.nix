{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  boot = {
    initrd.availableKernelModules = ["xhci_pci" "ehci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
    initrd.kernelModules = ["dm-snapshot"];
    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/c896dfba-f744-42d1-bb0a-474f15bf0c36";
    fsType = "ext4";
  };

  # fileSystems."/mnt/data" = {
  #   device = "/dev/mapper/pool-data";
  #   fsType = "ext4";
  # };

  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
