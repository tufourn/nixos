{
  inputs,
  lib,
  ...
}: {
  flake.modules.nixos.oracle-nixos2 = {
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
      openssh.authorizedKeys.keys = [''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdTgvLj8CM1czQPHA5NLJ0CiGNj/9aCZqkjIEicxsVTvdTB2lH0IVY/sB44HR8qAV8bbCoVFEZ3oYgwVQ4VCpPPRZF/ZMXpWE9Km6Gm+ggZS3yYL/lGk9+dVtT4TvhVf/kqdY2sx8XDkYN59u490l9mnwwmfxQtXZAMuBHgZPj01hiACyFZbxF0GsQUxjun2OI+/LRZYvBRwnp+L3Sk0aXzmKXwoPdphf2I4G9PAyUss3hQh3y2Bh57iFewSgxQVzeR2BXAvYhkRZhF90bd3mqWfo3aWuU6jdtUIS6vN0GKIbS3qYFTLpkanCxGCkuDO5QYYNRIcNWv23kIdHnot8D ssh-key-2026-04-14''];
    };

    # Workaround for https://github.com/NixOS/nix/issues/8502
    services.logrotate.checkConfig = false;

    boot.tmp.cleanOnBoot = true;
    zramSwap.enable = true;
    networking.hostName = "oracle-nixos2";
    networking.domain = "";
    services.openssh.enable = true;
    users.users.root.openssh.authorizedKeys.keys = [''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdTgvLj8CM1czQPHA5NLJ0CiGNj/9aCZqkjIEicxsVTvdTB2lH0IVY/sB44HR8qAV8bbCoVFEZ3oYgwVQ4VCpPPRZF/ZMXpWE9Km6Gm+ggZS3yYL/lGk9+dVtT4TvhVf/kqdY2sx8XDkYN59u490l9mnwwmfxQtXZAMuBHgZPj01hiACyFZbxF0GsQUxjun2OI+/LRZYvBRwnp+L3Sk0aXzmKXwoPdphf2I4G9PAyUss3hQh3y2Bh57iFewSgxQVzeR2BXAvYhkRZhF90bd3mqWfo3aWuU6jdtUIS6vN0GKIbS3qYFTLpkanCxGCkuDO5QYYNRIcNWv23kIdHnot8D ssh-key-2026-04-14''];
    system.stateVersion = "23.11";
  };
}
