{ pkgs, ... }:
let
  myAliases = {
    ls = "eza --icons --group-directories-first";
    ll = "ls -al";
    grep = "grep --color";
    ".." = "cd ..";
    cat = "bat";
  };
in 
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion  = true;
    shellAliases = myAliases;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "thefuck"];
      theme = "robbyrussell";
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  programs.starship = {
   enable = true;
   enableZshIntegration = true;
   enableBashIntegration = true;
  };

  fonts.fontconfig.enable = true;
  
  home.file.".config/starship.toml".source = ../../starship.toml;

  home.packages = with pkgs; [
    bat
    eza
    starship
    thefuck
    oh-my-zsh
    zsh
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}
