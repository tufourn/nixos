{
  flake.modules.nixos.battery = {
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
  };
}
