{config, pkgs, ...}:

{
  programs.alacritty.enable = true;
  programs.alacritty = {
    settings = {
      window = {
        opacity = 0.5;
      };
      font = {
        normal.family = "JetBrainsMono NerdFont Mono";
        size = 13.0;
        
      };
      
    };
  };



}