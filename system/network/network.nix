{config, pkgs, SystemInfo, ...}:

{
  networking.hostName = SystemInfo.hostname; # Define your hostname.
  networking.networkmanager.enable = true; # Enable networking

  #Firewall
  networking.firewall.enable = true;
  networking.firewall = {

    allowedTCPPorts = [ 
      25565 #Minecraft default port
    ];
    allowedUDPPorts = [
      24454 #the default port for simple voice chat
      25565 #MC default port, used for simple voice chat
    ];
  };



}