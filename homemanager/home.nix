{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "brian";
  home.homeDirectory = "/home/brian";

  imports = [
    ./alacritty.nix
    ./Hypr/hyprland.nix
    ./Cli/fastfetch.nix
    ./Cli/git.nix
  ];
  gtk.cursorTheme.size = 24;


  
  home.stateVersion = "24.11";

  
  home.packages = [
    
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
   
  };

  
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
