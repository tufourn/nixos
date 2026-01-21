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
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    fastfetch
    brightnessctl
    eza
    fd
  ];

  imports =
    [
      ./common
    ]
    ++ lib.optional
    (builtins.pathExists ./hosts/${hostname})
    ./hosts/${hostname};
}
