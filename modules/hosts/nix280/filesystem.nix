{...}: {
  flake.modules.nixos.nix280 = {
    boot.initrd.luks.devices."luks-986cc245-d668-4c99-a04c-5a66bcbf5258".device = "/dev/disk/by-uuid/986cc245-d668-4c99-a04c-5a66bcbf5258";

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/4c92ec12-8f1b-4a66-be41-c2b7820ee78b";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/D6C0-CF16";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    swapDevices = [];
  };
}
