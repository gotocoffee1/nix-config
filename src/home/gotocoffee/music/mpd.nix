{ ... }:
{
  services.mpd = {
    enable = true;
    network.startWhenNeeded = true;
  };
}
