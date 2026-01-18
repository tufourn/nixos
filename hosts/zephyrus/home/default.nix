{
  inputs,
  config,
  pkgs,
  ...
}: {
  home.username = "tufourn";
  home.homeDirectory = "/home/tufourn";

  imports = [
    ../../../home/programs/librewolf.nix
    ../../../home/programs/hyprland.nix
    ../../../home/programs/kitty.nix
    ../../../home/programs/neovim
    ../../../home/programs/tmux.nix
    ../../../home/programs/waybar
    ../../../home/programs/tofi.nix

    ../../../home/modules/fonts.nix
    ../../../home/modules/i18n.nix
    ../../../home/modules/git.nix
    ../../../home/modules/packages.nix
    ../../../home/modules/zsh.nix
  ];

  home.stateVersion = "25.05";
}
