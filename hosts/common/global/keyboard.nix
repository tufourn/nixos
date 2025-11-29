{
  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak";
    options = "ctrl:nocaps";
  };

  console.useXkbConfig = true;
}
