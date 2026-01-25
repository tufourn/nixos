{
  description = "tufourn's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    sops-nix,
    ...
  }: let
    lib = nixpkgs.lib // home-manager.lib;
    mkHost = {
      hostname,
      system,
      username,
      hostModule,
    }:
      lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs hostname username;
        };
        modules = [
          hostModule
          sops-nix.nixosModules.sops
          home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = import ./home;
              extraSpecialArgs = {
                inherit inputs hostname username;
              };
            };
          }
        ];
      };
  in {
    nixosConfigurations = {
      nix280 = mkHost {
        hostname = "nix280";
        system = "x86_64-linux";
        username = "tufourn";
        hostModule = ./hosts/nix280;
      };

      zephyrus = mkHost {
        hostname = "zephyrus";
        system = "x86_64-linux";
        username = "tufourn";
        hostModule = ./hosts/zephyrus;
      };

      thinkcentre = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/thinkcentre
          sops-nix.nixosModules.sops
        ];
      };
    };
  };
}
