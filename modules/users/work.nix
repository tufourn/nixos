{inputs, ...}: let
  username = "tufourn";
in {
  flake.homeConfigurations = inputs.self.lib.mkHomeManager "x86_64-linux" "${username}@work";

  flake.modules.homeManager."${username}@work" = {
    imports = with inputs.self.modules.homeManager; [
      neovim
      tmux
    ];

    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "25.05";

    programs.home-manager.enable = true;
  };
}
