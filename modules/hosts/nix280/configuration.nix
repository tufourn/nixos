{inputs, ...}: {
  flake.modules.nixos.nix280 = {pkgs, ...}: {
    imports = with inputs.self.modules.nixos; [
      docker
      hyprland
      keyboard
      locale
      nh
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
    ];
  };
}
