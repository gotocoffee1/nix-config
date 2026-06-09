{ ... }:
{
  services.mpd = {
    enable = true;
    network.startWhenNeeded = true;
    extraConfig = ''
       audio_output {
           type   "fifo"
           name   "music_fifo"
           path   "/tmp/mpd.fifo"
           format "44100:16:2"
       }
       audio_output {
           type "pipewire"
           name "PipeWire output"
      }
    '';
  };
  services.mpdris2 = {
    enable = true;
  };
}
