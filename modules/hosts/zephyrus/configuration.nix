{inputs, ...}: {
  flake.modules.nixos.zephyrus = {
    imports = with inputs.self.modules.nixos; [
      systemd-boot
      system-minimal
    ];
  };
}
