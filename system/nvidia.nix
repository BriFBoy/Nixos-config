{config, lib, pkgs, ...}:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

  modesetting.enable = true;
  open = true;
  nvidiaSettings = true;

  package = config.boot.kernelPackages.nvidiaPackages.latest;

  };
}
