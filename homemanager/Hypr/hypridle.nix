{config, pkgs, ...}:

{
  services.hypridle.enable = true;
  services.hypridle.settings = {
    general = {
      lock_cmd = "pidof hyprlock || hyprlock";      # avoid starting multiple hyprlock instances.
      before_sleep_cmd = "loginctl lock-session";    # lock before suspend.
      after_sleep_cmd = "hyprctl dispatch dpms on";  # to avoid having to press a key twice to turn on the display.
    };

    listener = [
      {
        timeout = 120;
        on-timeout = "brightnessctl -s set 10";         
        on-resume = "brightnessctl -r"; 
      }
      {
        timeout = 150;                                         
        on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0"; # turn off keyboard backlight.
        on-resume = "brightnessctl -rd rgb:kbd_backlight";
      }
      {
        timeout = 300;
        on-timeout = "loginctl lock-session"; 
      }
      {
        timeout = 330;
        on-timeout = "hyprctl dispatch dpms off";
        on-resume = "hyprctl dispatch dpms on";  
      }
      {
        timeout = 600;
        on-timeout = "systemctl suspend"; 
      }                
    ];
  };
}