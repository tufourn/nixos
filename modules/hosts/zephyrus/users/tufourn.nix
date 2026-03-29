{inputs, ...}: {
  flake.modules.nixos.zephyrus = {
    imports = with inputs.self.modules.nixos; [
      tufourn
    ];

    home-manager.users.tufourn = {
      imports = with inputs.self.modules.homeManager; [
        sops
        signal-desktop
      ];

      sops = {
        defaultSopsFile = ../../../../secrets/zephyrus.yaml;
      };
    };
  };
}
