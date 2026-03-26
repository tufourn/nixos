{
  flake.modules.nixos.zephyrus = {
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/2f008ba7-9a63-44a3-8a41-c525e1a58631";
      fsType = "ext4";
    };

    boot.initrd.luks.devices."luks-693c2d5b-3a58-49bf-8c8b-e74a6d0dc856".device = "/dev/disk/by-uuid/693c2d5b-3a58-49bf-8c8b-e74a6d0dc856";

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/4E1D-8BE5";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    swapDevices = [];
  };
}
