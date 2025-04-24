{pkgs, config, lib, ...}:

{

   environment.systemPackages = with pkgs; [
    docker
  ];
  virtualisation.docker.enable = true;

}