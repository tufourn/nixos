{
  flake.modules.homeManager.fonts = {pkgs, ...}: {
    home.packages = with pkgs; [
      iosevka
      nerd-fonts.jetbrains-mono
    ];

    fonts.fontconfig.enable = true;
  };
}
