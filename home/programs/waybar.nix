{...}: {
  programs.waybar = {
    enable = true;
    settings = {
      main = {
        modules-right = ["pulseaudio" "battery" "clock"];
      };
    };
  };
}
