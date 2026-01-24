{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "zephyrus"; # Define your hostname.
  networking.networkmanager.enable = true;

  virtualisation.docker = {
    enable = true;
  };

  programs.zsh.enable = true;

  users.users.tufourn = {
    isNormalUser = true;
    description = "tufourn";
    extraGroups = ["docker" "networkmanager" "wheel"];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wl-clipboard
    qmk

    unzip
    p7zip
    gnumake
    curl
    wget
    ripgrep
    fd
    tree
    htop
    tmux
  ];

  hardware.keyboard.qmk.enable = true;

  programs.hyprland.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };

  system.stateVersion = "25.05";
}
