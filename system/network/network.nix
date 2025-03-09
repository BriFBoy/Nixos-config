{config, pkgs, ...}:

{
  networking.hostName = "BrianNixos"; # Define your hostname.
  networking.networkmanager.enable = true; # Enable networking

  #Firewall
  networking.firewall.enable = true;
  networking.firewall = {

    allowedTCPPorts = [ 25565 ];
  };


  networking.nat = {
    forwardPorts = [
      {
        sourcePort = 25565;
        proto = "tcp";
      }
    ];
  };
}