{pkgs, config, ...}:

{
  programs.fastfetch.enable = true;

  programs.fastfetch.settings = {
    


    modules = [
    "break"
    "os"
    "kernel"
    "uptime"
    "packages"
    "shell"
    "de"
    "wm"
    "font"
    "cursor"
    "terminal"
    "memory"
    "battery"
    "break"
    "colors"
    ];
    




  };
}