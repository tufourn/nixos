{lib, ...}: {
  flake.modules.nixos.zephyrus = {
    networking.useDHCP = lib.mkDefault true;
    networking.hostName = "zephyrus";
    networking.networkmanager.enable = true;
  };
}
