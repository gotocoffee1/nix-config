{
  pkgs,
  inputs,
  config,
  ...
}:
let
  gui = config.homeFeatures.gui;
in
{
  programs.firefox = {
    enable = gui.enable;
    policies = {
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          private_browsing = true;
        };
      };
    };
    profiles.default = {
      isDefault = true;
      extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ublock-origin
        ];
      };

      search = {
        force = true;
        default = "ecosia";
      };
      settings = {
        "browser.startup.homepage" = "about:blank";
        "browser.newtabpage.enabled" = false;
        # Prevent Firefox from suggesting to re-open tabs from last session
        "browser.startup.couldRestoreSession.count" = -1;
        # Default Ctrl-F to highlight all results by default
        "findbar.highlightAll" = true;
        "browser.toolbars.bookmarks.visibility" = "always";

        "privacy.sanitize.pending" =
          "[{\"id\":\"shutdown\",\"itemsToClear\":[\"cache\",\"formdata\",\"browsingHistoryAndDownloads\",\"cookiesAndStorage\"],\"options\":{}},{\"id\":\"newtab-container\",\"itemsToClear\":[],\"options\":{}}]";
        "privacy.sanitize.sanitizeOnShutdown" = true;

        "extensions.autoDisableScopes" = 0;
        "extensions.update.autoUpdateDefault" = false;
        "extensions.update.enabled" = false;
      };
    };
  };
}
