{...}: {
  flake.modules.nixos.thinkcentre = {
    networking.hostName = "thinkcentre";
    networking.useDHCP = true;
  };
}
