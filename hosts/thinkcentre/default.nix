{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "thinkcentre";
  networking.useDHCP = true;

  virtualisation.docker = {
    enable = true;
  };

  users.users.tufourn = {
    isNormalUser = true;
    description = "tufourn";
    extraGroups = ["wheel"];
    packages = with pkgs; [];
  };

  services.openssh.enable = true;

  system.stateVersion = "25.11";
}
