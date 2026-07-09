{
  role.firefox.homeManager =
    {
      pkgs,
      inputs,
      config,
      lib,
      ...
    }:
    {
      programs.firefox = {
        enable = true;
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
              default = lib.mkDefault engine;
              privateDefault = lib.mkDefault engine;
            };
          settings = {
            "findbar.highlightAll" = true;

            "extensions.autoDisableScopes" = 0;
            "extensions.update.autoUpdateDefault" = false;
            "extensions.update.enabled" = false;
          };
        };
      };
    };
}
