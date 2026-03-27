{
  inputs,
  lib,
  ...
}: {
  flake.modules.nixos.thinkcentre = {
    config,
    pkgs,
    ...
  }: {
    imports = with inputs.self.modules.nixos; [
      docker
      locale
      keyboard
      sops
      ssh
      systemd-boot
      system-minimal
    ];

    users.groups.media = {};

    users.users.tufourn = {
      isNormalUser = true;
      extraGroups = ["wheel" "media"];
    };

    sops = {
      age.keyFile = "${config.users.users.tufourn.home}/.config/sops/age/keys.txt";
      defaultSopsFile = ../../../secrets/thinkcentre.yaml;
    };

    sops.secrets."pangolin/newt_id".owner = "tufourn";
    sops.secrets."pangolin/newt_secret".owner = "tufourn";

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

    sops.secrets.vps_domain = {
      sopsFile = ../../../secrets/shared.yaml;
    };

    sops.secrets."linkwarden/nextauth_secret".owner = config.services.linkwarden.user;

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
    };

    sops.secrets."paperless/secret_key".owner = "paperless";
    sops.secrets."paperless/admin_password".owner = "paperless";
    sops.templates.paperless-env = {
      owner = "paperless";
      content = ''
        PAPERLESS_SECRET_KEY=${config.sops.placeholder."paperless/secret_key"}
        PAPERLESS_URL=https://paperless.${config.sops.placeholder.vps_domain}
        PAPERLESS_ADMIN_USER=admin
        PAPERLESS_ADMIN_PASSWORD=${config.sops.placeholder."paperless/admin_password"}
        PAPERLESS_OCR_LANGUAGE="eng+vie"
      '';
    };

    services.paperless = {
      enable = true;
      environmentFile = config.sops.templates.paperless-env.path;
      mediaDir = "/mnt/media/paperless/documents";
      dataDir = "/mnt/media/paperless";
      address = "0.0.0.0";
      port = 28981;
    };

    networking.firewall.allowedTCPPorts = [
      3000 # linkwarden
      3001 # uptime-kuma
      4533 # navidrome
      8000 # audiobookshelf
      8003 # calibre-web
      28981 # paperless-ngx
    ];
    networking.firewall.allowedUDPPorts = [51820];

    services.openssh.settings.PasswordAuthentication = lib.mkForce true;

    system.stateVersion = "25.11";
  };
}
