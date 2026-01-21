{lib, ...}: {
  wayland.windowManager.hyprland.settings.monitor = lib.mkForce [
    "eDP-1, disable"
    "HDMI-A-1, 2560x1440@144, 0x0, 1"
  ];
}
