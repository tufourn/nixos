{...}: {
  flake.modules.nixos.zephyrus = {modulesPath, ...}: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod"];
    boot.initrd.kernelModules = [];
    boot.kernelModules = ["kvm-amd"];
    boot.extraModulePackages = [];

    hardware.nvidia.prime = {
      amdgpuBusId = "PCI:4:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    hardware.keyboard.qmk.enable = true;

    nixpkgs.hostPlatform = "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = true;
  };
}
