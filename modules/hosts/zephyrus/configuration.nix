{inputs, ...}: {
  flake.modules.nixos.zephyrus = {pkgs, ...}: {
    imports = with inputs.self.modules.nixos; [
      bluetooth
      docker
      hyprland
      keyboard
      locale
      nh
      nvidia
      nvidia-prime
      systemd-boot
      system-minimal
    ];

    environment.systemPackages = with pkgs; [
      wl-clipboard
      unzip
      p7zip
      gnumake
      curl
      wget
      ripgrep
      fd
      tree
      htop
      sops
      flameshot
      grim
      vagrant
    ];
  };
}
