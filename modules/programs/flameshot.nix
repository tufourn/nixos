{
  flake.modules.homeManager.flameshot = {
    services.flameshot = {
      enable = true;
      settings = {
        General = {
          useGrimAdapter = true;
          disabledGrimWarning = true;
        };
      };
    };
  };
}
