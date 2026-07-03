{
  gtc.gaming = {
    nixos = {
      programs = {
        steam.enable = true;
      };
    };
    homeManager =
      { pkgs, ... }:
      {
        # https://github.com/NixOS/nixpkgs/issues/195512
        #home.packages = with pkgs; [ discord ];
      };
  };
}
