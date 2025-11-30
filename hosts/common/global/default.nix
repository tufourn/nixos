{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./locale.nix
    ./nix.nix
    ./fish.nix
    ./keyboard.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  programs = {
    git.enable = true;
    vim.enable = true;
  };

  environment.variables.EDITOR = "vim";
}
