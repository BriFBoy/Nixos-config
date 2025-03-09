{config, pkgs, ...}:

{
  networking.hostName = "BrianNixos"; # Define your hostname.
  networking.networkmanager.enable = true; # Enable networking

  #Firewall
  networking.firewall.enable = true;
  networking.firewall = {

    allowedTCPPorts = [ 
      25565
    ];
    allowedUDPPorts = [
      24454
    ];
  };



}