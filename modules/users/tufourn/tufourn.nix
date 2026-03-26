{
  inputs,
  self,
  ...
}: let
  username = "tufourn";
in {
  flake.modules.nixos."${username}" = {pkgs, ...}: {
    imports = with inputs.self.modules.nixos; [
      home-manager
    ];

    users.users."${username}" = {
      isNormalUser = true;
      shell = pkgs.zsh;
    };
    programs.zsh.enable = true;

    home-manager.users."${username}" = {
      imports = with inputs.self.modules.homeManager; [
        librewolf
        neovim
      ];

      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.05";
    };
  };
}
