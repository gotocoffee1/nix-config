{pkgs, ...}:
{
  programs.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = ./. + "/minimal";
        duration = "3m";
      };
    };
  };
}
