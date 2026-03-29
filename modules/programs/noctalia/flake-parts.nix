{inputs, ...}: {
  flake-file.inputs = {
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";
  };
}
