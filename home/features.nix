{lib, ...}:
with lib;
{
  options.home-config = {
    gui = {
      enable = mkEnableOption "Enable GUI";
      vnc = {
        enable = mkEnableOption "Enable VNC";
      };
    };
  };
}
