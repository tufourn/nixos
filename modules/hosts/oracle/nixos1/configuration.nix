{
  inputs,
  lib,
  ...
}: {
  flake.modules.nixos.oracle-nixos1 = {
    config,
    pkgs,
    ...
  }: {
    imports = with inputs.self.modules.nixos; [
      system-minimal
    ];

    users.users.tufourn = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      openssh.authorizedKeys.keys = [''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3kwi4eNc+ve7dtMEA+C17Y0g73FgWwTv33C6BacGo04XWiYf/DkE0WjrJcvTapMZbYPFowW6LYd17wRUd2xLh+j5mY1PdHOLbhnaf5k2rEjdaMeZ6n8x0yNE+Fp4q4hYOfR/Iew0IlZ1R9U3fe0IS+0EK/KGU1H4SK47ER/VkCIRNcKAGxE+iEH8yK60UnHWC7aBCAru/uZ2O0SzKTgGqbHQzIUmcjIgfZdXTQMz31ZVXuqAXxFS3z8detMcNuw89bUPqsoCEz2iKVXyXP2Z/AkpdPAg1bSkMEv3Ci8uRQhB0irlbFH0eyb5kZbxhJ7inIlLwC9fuBOQ/HcxULSHR ssh-key-2026-04-14''];
    };

    # Workaround for https://github.com/NixOS/nix/issues/8502
    services.logrotate.checkConfig = false;

    boot.tmp.cleanOnBoot = true;
    zramSwap.enable = true;
    networking.hostName = "oracle-nixos1";
    networking.domain = "";
    services.openssh.enable = true;
    system.stateVersion = "23.11";
    users.users.root.openssh.authorizedKeys.keys = [''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3kwi4eNc+ve7dtMEA+C17Y0g73FgWwTv33C6BacGo04XWiYf/DkE0WjrJcvTapMZbYPFowW6LYd17wRUd2xLh+j5mY1PdHOLbhnaf5k2rEjdaMeZ6n8x0yNE+Fp4q4hYOfR/Iew0IlZ1R9U3fe0IS+0EK/KGU1H4SK47ER/VkCIRNcKAGxE+iEH8yK60UnHWC7aBCAru/uZ2O0SzKTgGqbHQzIUmcjIgfZdXTQMz31ZVXuqAXxFS3z8detMcNuw89bUPqsoCEz2iKVXyXP2Z/AkpdPAg1bSkMEv3Ci8uRQhB0irlbFH0eyb5kZbxhJ7inIlLwC9fuBOQ/HcxULSHR ssh-key-2026-04-14''];
  };
}
