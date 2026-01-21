{...}: {
  programs.git = {
    enable = true;
    userName = "Tuan Nguyen";
    userEmail = "noreply@tufourn.com";
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
