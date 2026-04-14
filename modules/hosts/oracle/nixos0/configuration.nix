{
  inputs,
  lib,
  ...
}: {
  flake.modules.nixos.oracle-nixos0 = {
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
      openssh.authorizedKeys.keys = [''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMHdTwYUlAq4HLRm78WACuzhqrsGB8+cXLVT0qrbpfmkm+X2AdzF9TDxhXn8x6Al8h48dUr7HhICx3YSArNJ2x1F9ysLJ1wZ7om2l1g8wRR3jwInun5lCPoCLl40g8PSdPOSCYmOoLG2HmtNVXwXeCYXDszbEgOduy8RzDpw0Xmb/uU64Xm3vuUgMx9Sy5eheKLfkHNPOK2xYbwmVHVbt4OnfSQgGrrAj75JFuRehM2MT/83wBJ1YHKJ5M6rnXFnn79CXVc661JtVu9d4lPSp4mkp/H5DeAgzu0wj+Vg7+8eMFi7fqubBQhaY55eGqa3Ais8I8ZGTZkReABtopHz0D ssh-key-2026-04-14''];
    };

    # Workaround for https://github.com/NixOS/nix/issues/8502
    services.logrotate.checkConfig = false;

    boot.tmp.cleanOnBoot = true;
    zramSwap.enable = true;
    networking.hostName = "oracle-nixos0";
    networking.domain = "";
    services.openssh.enable = true;
    users.users.root.openssh.authorizedKeys.keys = [''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMHdTwYUlAq4HLRm78WACuzhqrsGB8+cXLVT0qrbpfmkm+X2AdzF9TDxhXn8x6Al8h48dUr7HhICx3YSArNJ2x1F9ysLJ1wZ7om2l1g8wRR3jwInun5lCPoCLl40g8PSdPOSCYmOoLG2HmtNVXwXeCYXDszbEgOduy8RzDpw0Xmb/uU64Xm3vuUgMx9Sy5eheKLfkHNPOK2xYbwmVHVbt4OnfSQgGrrAj75JFuRehM2MT/83wBJ1YHKJ5M6rnXFnn79CXVc661JtVu9d4lPSp4mkp/H5DeAgzu0wj+Vg7+8eMFi7fqubBQhaY55eGqa3Ais8I8ZGTZkReABtopHz0D ssh-key-2026-04-14''];
    system.stateVersion = "23.11";
  };
}
