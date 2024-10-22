{ pkgs, userSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ../../user/shell/sh.nix # zsh and bash config
    ../../user/git/git.nix # git config
  ];

  home.sessionVariables = {
    EDITOR = "nano";
  };

  programs.home-manager.enable = true;
}
