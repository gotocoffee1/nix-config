{
  gtc.gui.homeManager =
    {
      config,
      osConfig,
      inputs,
      pkgs,
      lib,
      ...
    }:
    let
      gui = config.homeFeatures.gui;
      fonts = config.homeFeatures.fonts;
    in
    {

      xdg.configFile."caelestia/shell.json".force = true;
      xdg.configFile."caelestia/cli.json".force = true;

      home.activation.caelestiaMutableConfig = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
        for f in shell.json cli.json; do
          target="$HOME/.config/caelestia/$f"
          if [ -L "$target" ]; then
            run cp --remove-destination "$(readlink "$target")" "$target"
            run chmod u+w "$target"
          fi
        done
      '';
      home.file.".face".source = ./face.png;
      programs.caelestia = {
        enable = true;
        settings = {
          appearance = {
            font = {
              clock = fonts.sans.name;
              workspaces = fonts.sans.name;
              mono.family = fonts.mono.name;
              label.family = fonts.sans.name;
              body.family = fonts.sans.name;
              title.family = fonts.sans.name;
              headline.family = fonts.sans.name;
            };
            transparency = {
              enabled = true;
            };
          };
          paths = {
            wallpaperDir = inputs.gruvbox-wallpapers.packages."${pkgs.stdenv.hostPlatform.system}".default;
            sessionGif = ./session.gif;
            mediaGif = ./media.gif;
          };
          general = {
            apps = {
              terminal = [ gui.terminal ];
              explorer = [ gui.explorer ];
              playback = [ "rmpc" ];
            };
          };
          services = {
            defaultPlayer = "rmpc";
          };
          background = {
            desktopClock = {
              enabled = true;
            };
          };
          border = {
            rounding = gui.rounding;
            thickness = gui.border;
          };
          bar = {
            clock = {
              showIcon = false;
              showDate = true;
            };
            status = {
              showAudio = true;
              showBattery = osConfig.envFeatures.hardware.hasBattery;
              showMicrophone = true;
              showLockStatus = false;
            };
          };
          launcher = {
            actionPrefix = ":";
          };
        };
        cli = {
          enable = true; # Also add caelestia-cli to path
          settings = {
            theme = {
              enableGtk = false;
              enableTerm = false;
              enableFuzzel = true;
              enableQt = false;
            };
          };
        };
      };
    };
}
