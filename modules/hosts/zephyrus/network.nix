{lib, ...}: {
  flake.modules.nixos.zephyrus = {
    networking.hostName = "zephyrus";
    networking.useDHCP = lib.mkDefault true;
    networking.networkmanager.enable = true;
  };
}
