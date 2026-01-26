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

  sops.secrets."pangolin/newt_id" = {
    owner = "tufourn";
  };
  sops.secrets."pangolin/newt_secret" = {
    owner = "tufourn";
  };

  sops.templates.pangolin-env = {
    content = ''
      PANGOLIN_ENDPOINT=https://pangolin.${config.sops.placeholder.vps_domain}
      NEWT_ID=${config.sops.placeholder."pangolin/newt_id"}
      NEWT_SECRET=${config.sops.placeholder."pangolin/newt_secret"}
    '';
  };

  services.newt = {
    enable = true;
    environmentFile = config.sops.templates.pangolin-env.path;
  };

  # since this is a public repo and i don't want people to know where i'm hosting stuff
  # TODO: move to a private repo
  sops.secrets.vps_domain = {
    sopsFile = ../../secrets/shared.yaml;
  };

  sops.secrets."linkwarden/nextauth_secret" = {
    owner = config.services.linkwarden.user;
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
  };

  services.navidrome = {
    enable = true;
    group = "media";
    settings = {
      MusicFolder = "/mnt/media/music";
      Address = "0.0.0.0";
      Port = 4533;
    };
  };

  sops.templates.linkwarden-env = {
    owner = "linkwarden";
    content = ''
      NEXTAUTH_URL=https://linkwarden.${config.sops.placeholder.vps_domain}
    '';
  };

  services.linkwarden = {
    enable = true;
    group = "media";
    host = "0.0.0.0";
    port = 3000;
    secretFiles = {
      NEXTAUTH_SECRET = config.sops.secrets."linkwarden/nextauth_secret".path;
    };
    storageLocation = "/mnt/media/bookmarks";
    environmentFile = config.sops.templates.linkwarden-env.path;
    # enableRegistration = true; # needed for first user
  };

  networking.firewall.allowedTCPPorts = [
    3000 # linkwarden
    3001 # uptime-kuma
    4533 # navidrome
    8000 # audiobookshelf
    8003 # calibre-web
  ];
  networking.firewall.allowedUDPPorts = [51820];

  system.stateVersion = "25.11";
}
