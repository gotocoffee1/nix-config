{
  inputs,
  den,
  so,
  ...
}:
{
  imports = [ (inputs.den.namespace "so" false) ];
  den.aspects.snow_owlia = { user, ... }: {
    includes = [
      so.locale
      den.batteries.define-user
      (den.batteries.user-shell "bash")
    ];
    user = { lib, ... }: {
      uid = 1001;
      extraGroups = [
        "networkmanager"
      ]
      ++ lib.optional user.isPrimary "wheel";
    };

  };
  so.gui-tools.includes = [
    so.firefox
    so.libreoffice
  ];
  so.desktop.includes = [ ];
  so.gui-desktop.includes = [
    so.desktop
    so.gui-tools
    so.plasma
    so.style
  ];
}
