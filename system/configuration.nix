{ config, pkgs, inputs, UserInfo, SystemInfo, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      ./nvidia.nix
      ./plasma6.nix
      ./hyprland.nix
      ./network/network.nix
      ./docker.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  services.displayManager.ly.enable = true;
  

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "no";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${UserInfo.username} = {
    isNormalUser = true;
    description = "Main User";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    prismlauncher
    vscodium
    keepassxc
    spotify
    vesktop
    discord
    peaclock
    jetbrains.idea-community-bin
    modrinth-app
    libreoffice
    floorp
    pgadmin4-desktopmode
    ];
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    alacritty
    fastfetch
    pavucontrol
    cava
    cmatrix
    git
    onedriver
    nemo
    neovim
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
    
  ];
  environment.variables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };


  services.pipewire.wireplumber.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    jdk
  ];

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ UserInfo.username ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.11"; 

}
