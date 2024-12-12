{pkgs, ...}:
{
  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 16;
    gtk.enable = true;
  };
}

