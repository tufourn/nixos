{inputs, ...}: {
  flake.modules.nixos.nix280 = {
    imports = with inputs.self.modules.nixos; [
      tufourn
    ];

    users.users.tufourn.extraGroups = ["docker"];
  };
}
