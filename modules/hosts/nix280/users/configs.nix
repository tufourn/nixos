{lib, ...}: {
  flake.modules.nixos.nix280 = {
    home-manager.users.tufourn = {
      programs.kitty.font.size = lib.mkForce 20.0;
      programs.tofi.settings.font-size = lib.mkForce 20;
    };
  };
}
