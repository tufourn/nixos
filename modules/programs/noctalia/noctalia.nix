{inputs, ...}: {
  flake.modules.homeManager.noctalia = {pkgs, ...}: {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    config = {
      programs.noctalia-shell = {
        enable = true;

        settings = {
          bar = {
            barType = "simple";
            position = "bottom";
            density = "mini";
            widgets = {
              left = [
                {
                  id = "Workspace";
                  showLabelsOnlyWhenOccupied = false;
                }
                {
                  id = "MediaMini";
                  maxWidth = 500;
                  useFixedWidth = true;
                }
              ];
              center = [
                {
                  id = "Clock";
                }
              ];
              right = [
                {
                  id = "Tray";
                }
                {
                  id = "Bluetooth";
                }
                {
                  id = "Volume";
                }
                {
                  id = "Battery";
                }
                {
                  id = "ControlCenter";
                }
              ];
            };
          };
        };
      };
    };
  };
}
