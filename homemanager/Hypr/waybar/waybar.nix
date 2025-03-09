{config, pkgs, ...}:

{
  programs.waybar.enable = true;
  programs.waybar.style = builtins.readFile ./style.css;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      output = [
        "DP-1"
        "HDMI-A-1"
      ];
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "group/middle" ];
      modules-right = [ "group/hardware" "network" "custom/logoutmenu" ];

      "hyprland/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        warp-on-scroll = false;
        
      };
      
      "clock" = {
          timezone = "Europe/Oslo";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt ="{:%d-%m-%Y}";
      };
      
      "load" = {
        max-length = 10;
        format = "{load1}";
      };
      "custom/logoutmenu" = {
        on-click = "wlogout";
        format = "";
      };
      "network" = {
        interface = "eno1";
        format = "{ifname}";
        format-wifi = "{essid} ({signalStrength}%) ";
        format-ethernet = "";
        disconnected = ""; 
        tooltip-format = "{ifname} via {gwaddr} 󰊗";
        tooltip-format-wifi = "{essid} ({signalStrength}%) ";
        tooltip-format-ethernet = "Connected";
        tooltip-format-disconnected = "Disconnected";
        max-length = 50;
      };
      "pulseaudio" = {
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {icon}";
        format-muted = "";
        format-icons = {
          "alsa_output.pci-0000_00_1f.3.analog-stereo" = "";
          "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "";
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          phone-muted = "";
          portable = "";
          car = "";
          default = ["" ""];
        };
        scroll-step = 1;
        on-click = "pavucontrol";
        ignored-sinks = ["Easy Effects Sink"];
      };

      "tray" = {
        icon-size = 21;
        spacing = 10;
      };

      "cpu" = {
        format = "{usage}% ";
      };

      "memory" = {
        format = "{percentage}% ";
      };

      "disk" = {
        format = "{percentage_free}% ";
      };

      "group/middle" = {
        orientation = "horizontal";
        modules = [
          "tray"
          "clock"
          "pulseaudio"
          
        ];
      };

      "group/hardware" = {
        orientation = "horizontal";
        modules = [
          "memory"
          "cpu"
          "disk"
        ];
      };

    };
  };
}