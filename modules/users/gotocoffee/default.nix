{
  inputs,
  den,
  gtc,
  ...
}:
{
  imports = [ (inputs.den.namespace "gtc" false) ];
  den.aspects.gotocoffee = { user, ... }: {
    includes = [
      gtc.locale
      gtc.ssh
      den.batteries.define-user
      (den.batteries.user-shell "fish")
    ];
    user = { lib, ... }: {
      uid = 1000;
      extraGroups = [
        "networkmanager"
      ]
      ++ lib.optional user.isPrimary "wheel";
    };
  };
  gtc.gui-tools.includes = [
    gtc.firefox
    gtc.thunderbird
    gtc.keepass
  ];
  gtc.core-tools.includes = with gtc.tools; [
    bat
    fd
    rg
    btop
    direnv
    eza
    yazi
    qalc
    nvim
    vcs
  ];
  gtc.server.includes = [
    gtc.tools.btop
  ];
  gtc.devel.includes = [
    gtc.core-tools
    gtc.shell
    gtc.style
    gtc.aider
  ];
  gtc.desktop.includes = [
    gtc.core-tools
    gtc.shell
    gtc.style
    gtc.aichat
    gtc.ssh-client
    gtc.music
  ];
  gtc.gui-desktop.includes = [
    gtc.desktop
    gtc.gui-tools
    gtc.hyprland
    gtc.gui
  ];
}
