{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Tuan Nguyen";
        email = "noreply@tufourn.com";
      };
    };
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "noreply@tufourn.com";
        name = "Tuan Nguyen";
      };
      ui = {
        paginate = "never";
        default-command = "log";
      };
    };
  };
}
