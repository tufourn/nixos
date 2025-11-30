{
  inputs,
  config,
  pkgs,
  username,
  ...
}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  imports = [
    ./programs/librewolf.nix
    ./programs/hyprland.nix
    ./programs/kitty.nix
    ./programs/neovim
    ./programs/tmux.nix
    ./programs/waybar
    ./programs/tofi.nix

    ./modules/fonts.nix
    ./modules/i18n.nix
    ./modules/git.nix
    ./modules/packages.nix
    ./modules/zsh.nix
  ];

  home.stateVersion = "25.05";
}
