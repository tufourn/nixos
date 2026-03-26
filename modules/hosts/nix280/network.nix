{lib, ...}: {
  flake.modules.nixos.nix280 = {
    networking.useDHCP = lib.mkDefault true;
    networking.hostName = "nix280";
    networking.networkmanager.enable = true;
  };
}
