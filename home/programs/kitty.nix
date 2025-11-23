{...}: {
  programs.kitty = {
    enable = true;
    themeFile = "GitHub_Light_High_Contrast";
    font = {
      name = "Iosevka";
      size = 12.0;
    };

    settings = {
      disable_ligatures = "always";
    };
  };
}
