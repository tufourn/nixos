{
  config,
  lib,
  pkgs,
  username,
  hostname,
  ...
}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  imports = [
    ./common

    ./programs/librewolf.nix
    ./programs/hyprland.nix
    ./programs/kitty.nix
    ./programs/waybar
    ./programs/tofi.nix
  ];

  home.stateVersion = "25.05";
}
