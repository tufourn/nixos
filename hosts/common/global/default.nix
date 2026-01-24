{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./locale.nix
    ./nix.nix
    ./keyboard.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    tmux
  ];

  environment.variables.EDITOR = "vim";
}
