{lib, ...}: {
  flake.modules.nixos.oracle-nixos1 = {
    config,
    modulesPath,
    ...
  }: {
    imports = [(modulesPath + "/profiles/qemu-guest.nix")];
    boot.loader = {
      efi.efiSysMountPoint = "/boot/efi";
      grub = {
        efiSupport = true;
        efiInstallAsRemovable = true;
        device = "nodev";
      };
    };
    fileSystems."/boot/efi" = {
      device = "/dev/disk/by-uuid/F8E6-38E1";
      fsType = "vfat";
    };
    boot.initrd.availableKernelModules = ["ata_piix" "uhci_hcd" "xen_blkfront"];
    boot.initrd.kernelModules = ["nvme"];
    fileSystems."/" = {
      device = "/dev/sda1";
      fsType = "ext4";
    };
  };
}
