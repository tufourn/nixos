{inputs, ...}: {
  flake.modules.nixos.zephyrus = {
    imports = with inputs.self.modules.nixos; [
      tufourn
    ];
  };
}
