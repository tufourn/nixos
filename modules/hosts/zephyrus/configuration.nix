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
      sops
      systemd-boot
      system-minimal
    ];

    hardware.nvidia.prime = {
      amdgpuBusId = "PCI:4:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };

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

    sops = {
      age.keyFile = "/home/tufourn/.config/sops/age/keys.txt";
      defaultSopsFile = ../../../secrets/zephyrus.yaml;
    };
  };
}
