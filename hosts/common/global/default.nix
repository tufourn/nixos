{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./locale.nix
    ./nix.nix
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

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };
}
