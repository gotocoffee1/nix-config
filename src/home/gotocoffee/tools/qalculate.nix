{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libqalculate
  ];
  xdg.desktopEntries."Qalculate!" = {
    name = "Qalculate!";
    comment = "CLI calculator";
    exec = "qalc";
    terminal = true;
    icon = "qalculate";
  };
}
