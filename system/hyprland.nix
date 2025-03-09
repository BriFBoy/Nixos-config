{config, pkgs, inputs, ...}:

{

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    waybar
    dunst
    libnotify
    hyprpaper
    pywal
    hyprlock
    hypridle
    rofi-wayland
    wlogout
    hyprshot
  ];
}