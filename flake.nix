{
  description = "my flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixCats.url = "github:BirdeeHub/nixCats-nvim";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: let
    lib = nixpkgs.lib // home-manager.lib;
    systems = ["x86_64-linux" "aarch64-linux"];
    pkgsFor = lib.genAttrs systems (system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
  in {
    nixosConfigurations = {
      nix280 = lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/nix280
        ];
      };
    };

    homeConfigurations = {
      "tufourn@nix280" = lib.homeManagerConfiguration {
        modules = [./home];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {
          username = "tufourn";
          inherit inputs;
        };
      };
    };
  };
}
