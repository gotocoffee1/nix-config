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
        force = true;
        packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ublock-origin
        ];
        settings."uBlock0@raymondhill.net".settings = {
          selectedFilterLists = [
            "user-filters"
            "ublock-filters"
            "ublock-badware"
            "ublock-privacy"
            "ublock-quick-fixes"
            "ublock-unbreak"
            "easylist"
            "easyprivacy"
            "urlhaus-1"
            "plowe-0"
            "fanboy-cookiemonster"
            "ublock-cookies-easylist"
            "adguard-cookies"
            "ublock-cookies-adguard"
          ];
        };
      };

      search =
        let
          engine = "ecosia";
        in
        {
          force = true;
          default = engine;
          privateDefault = engine;
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
