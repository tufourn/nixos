{lib, ...}: {
  flake.modules.nixos.thinkcentre = {config, pkgs, ...}: {
    boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
    boot.initrd.kernelModules = [];
    boot.kernelModules = ["kvm-intel"];
    boot.extraModulePackages = [];

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-ocl
        intel-media-driver
      ];
    };

    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
