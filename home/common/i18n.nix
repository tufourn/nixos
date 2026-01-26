{pkgs, ...}: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-gtk
        qt6Packages.fcitx5-unikey
      ];
      settings = {
        inputMethod = {
          GroupOrder."0" = "Default";
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "Unikey";
          };
          "Groups/0/Items/0".Name = "keyboard-us";
          "Groups/0/Items/1".Name = "unikey";
        };
      };
    };
  };
}
