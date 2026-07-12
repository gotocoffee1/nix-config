{ role, gtc, ... }:
{
  gtc.browsh = {
    includes = [
      gtc.firefox
    ];
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          browsh
        ];
        xdg.configFile."browsh/config.toml" = {
          force = true;
          text = ''
            default_search_engine_base = "https://www.ecosia.org/search?method=index&q="
            [firefox]
            profile = "default"
          '';
        };
      };
  };
  gtc.firefox = {
    includes = [
      role.firefox
    ];
    homeManager = {
      programs.firefox = {
        profiles.default = {
          settings = {
            "browser.startup.homepage" = "about:blank";
            "browser.newtabpage.enabled" = false;
            # Prevent Firefox from suggesting to re-open tabs from last session
            "browser.startup.couldRestoreSession.count" = -1;
            "browser.toolbars.bookmarks.visibility" = "always";
            "browser.translations.automaticallyPopup" = false;
            "signon.rememberSignons" = false;

            "privacy.sanitize.pending" =
              "[{\"id\":\"shutdown\",\"itemsToClear\":[\"cache\",\"formdata\",\"browsingHistoryAndDownloads\",\"cookiesAndStorage\"],\"options\":{}},{\"id\":\"newtab-container\",\"itemsToClear\":[],\"options\":{}}]";
            "privacy.sanitize.sanitizeOnShutdown" = true;
          };
        };
      };
    };
  };
}
