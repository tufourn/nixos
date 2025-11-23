{
  inputs,
  config,
  pkgs,
  ...
}: {
  home.username = "tufourn";
  home.homeDirectory = "/home/tufourn";

  imports = [
    ./programs/firefox.nix
    ./programs/hyprland.nix
    ./programs/kitty.nix
    ./programs/neovim
    ./programs/tmux.nix
    ./programs/waybar.nix
    ./programs/tofi.nix

    ./modules/fonts.nix
    ./modules/git.nix
    ./modules/packages.nix
  ];

  home.stateVersion = "25.05";
}
