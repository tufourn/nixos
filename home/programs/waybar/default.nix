{...}: {
  programs.waybar = {
    enable = true;
    settings = {
      main = {
        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "custom/input_method"
          "temperature"
          "cpu"
          "memory"
          "wireplumber"
          "battery"
        ];

        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%A, %B %d, %Y (%R)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "days" = "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };

        "custom/input_method" = {
          exec = builtins.readFile ./input_method.sh;
          interval = 1;
          hide-empty-text = true;
        };
      };
    };

    style = builtins.readFile ./style.css;
  };
}
