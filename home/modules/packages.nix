{pkgs, ...}: {
  home.packages = with pkgs; [
    fastfetch
    brightnessctl

    clang-tools
  ];
}
