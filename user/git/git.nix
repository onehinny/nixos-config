{ pkgs, userSettings, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git = {
    enable = true;
    userName = "onehinny";
    userEmail = "8193447+onehinny@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = [ 
        ("/home/" + userSettings.username + "/.dotfiles")
        ("/home/" + userSettings.username + "/.dotfiles/.git")
     ];
    };
  };
}
