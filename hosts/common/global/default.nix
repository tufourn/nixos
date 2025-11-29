{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./locale.nix
    ./nix.nix
    ./fish.nix
    ./keyboard.nix
  ];
}
