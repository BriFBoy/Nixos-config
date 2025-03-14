{pkgs, config, ...}:

{
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [

    # Add any missing dynamic libraries for unpackaged programs

    # here, NOT in environment.systemPackages
    /home/brian/.jdks/temurin-21.0.6/bin/java
  ];
}