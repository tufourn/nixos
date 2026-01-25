{
  config,
  pkgs,
  ...
}: let
  wgIp = "100.89.128.4";
in {
  imports = [
    ./hardware-configuration.nix
    ../common/global
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "thinkcentre";
  networking.useDHCP = true;

  virtualisation.docker = {
    enable = true;
  };

  users.groups.media = {};

  users.users.tufourn = {
    isNormalUser = true;
    description = "tufourn";
    extraGroups = ["wheel" "media"];
    packages = with pkgs; [];
  };

  services.openssh.enable = true;

  sops = {
    age.keyFile = "/home/tufourn/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets/thinkcentre.yaml;
  };

  sops.secrets."pangolin/wireguard_private_key" = {};

  sops.secrets.vps_domain = {
    sopsFile = ../../secrets/shared.yaml;
  };

  networking.wireguard = {
    enable = true;
    interfaces = {
      wg0 = {
        ips = ["${wgIp}/30"];
        listenPort = 51820;
        privateKeyFile = config.sops.secrets."pangolin/wireguard_private_key".path;
        peers = [
          {
            publicKey = "REgEXZ7rBxiSwipIB7w00dq8KBfSRcaX9JfUaqV6omg=";
            allowedIPs = ["100.89.128.1/32"];
            endpoint = "pangolin.$(cat ${config.sops.secrets.vps_domain.path}):51820";
            persistentKeepalive = 5;
          }
        ];
      };
    };
  };

  services.uptime-kuma = {
    enable = true;
    settings = {
      HOST = "0.0.0.0";
      PORT = "3001";
    };
  };

  services.calibre-web = {
    enable = true;
    group = "media";
    listen = {
      ip = "0.0.0.0";
      port = 8003;
    };
    options = {
      calibreLibrary = "/mnt/media/ebooks";
      enableBookUploading = true;
      enableBookConversion = true;
    };
  };

  services.audiobookshelf = {
    enable = true;
    group = "media";
    host = "0.0.0.0";
    port = 8000;
    openFirewall = true;
  };

  services.navidrome = {
    enable = true;
    group = "media";
    openFirewall = true;
    settings = {
      MusicFolder = "/mnt/media/music";
      Address = "0.0.0.0";
      Port = 4533;
    };
  };

  networking.firewall.allowedTCPPorts = [
    51820

    3001 # uptime kuma
    8003 # calibre-web
  ];
  networking.firewall.allowedUDPPorts = [51820];

  system.stateVersion = "25.11";
}
