{config, pkgs, ...}: 

{

  programs.git = {
    enable = true;
    userName = "BriFBoy";
    userEmail = "98982693+BriFBoy@users.noreply.github.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };

}