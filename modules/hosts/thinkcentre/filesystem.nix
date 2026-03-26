{...}: {
  flake.modules.nixos.thinkcentre = {
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/956e3657-54ee-465c-a5e9-12db4fd24f65";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/5374-1E37";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    swapDevices = [];
  };
}
