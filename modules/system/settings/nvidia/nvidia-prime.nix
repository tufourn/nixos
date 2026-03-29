{
  flake.modules.nixos.nvidia-prime = {
    hardware.nvidia = {
      powerManagement.finegrained = true;

      prime.offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
}
