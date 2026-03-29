{
  flake.modules.homeManager.cli-tools = {pkgs, ...}: {
    home.packages = with pkgs; [
      fastfetch
      brightnessctl
      eza
      fd
    ];
  };
}
