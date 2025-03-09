{config, pkgs, ...}: 

{
  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
  
  preload = [ 
    "~/.dotfiles/homemanager/wallpaper/space_blue.jpg" 
    "~/.dotfiles/homemanager/wallpaper/water_at_night.jpg"];

  wallpaper = [
    "DP-1, ~/.dotfiles/homemanager/wallpaper/water_at_night.jpg"
    "HDMI-A-1, ~/.dotfiles/homemanager/wallpaper/water_at_night.jpg"
  ];
  };
  
}