{pkgs, ...}: {
  home.packages = [
    pkgs.tofi
  ];

  programs.tofi = {
    enable = true;
    settings = {
      font = "Iosevka";
      font-size = 12;
      font-features = "liga 0";

      border-width = 0;
      width = "50%";
      height = "50%";
    };
  };
}
