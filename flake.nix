{
  description = "tufourn's NixOS configuration";

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
      nix280 = let
        username = "tufourn";
      in
        lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/nix280
            home-manager.nixosModules.default
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username} = ./home;
                extraSpecialArgs = {inherit inputs username;};
              };
            }
          ];
        };
      zephyrus = let
        username = "tufourn";
      in
        lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/zephyrus
            home-manager.nixosModules.default
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username} = ./home;
                extraSpecialArgs = {inherit inputs username;};
              };
            }
          ];
        };
    };
  };
}
