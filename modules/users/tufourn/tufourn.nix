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
      extraGroups = ["docker" "networkmanager" "wheel" "kvm" "vboxusers"];
    };
    programs.zsh.enable = true;

    home-manager.users."${username}" = {
      imports = with inputs.self.modules.homeManager; [
        cli-tools
        flameshot
        fonts
        git
        hyprland
        i18n
        kitty
        librewolf
        neovim
        shell
        tmux
        tofi
        waybar
        yazi
      ];

      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.05";
    };
  };
}
