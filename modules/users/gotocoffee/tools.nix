{
  gtc.tools = {
    bat.homeManager =
      { pkgs, ... }:
      {
        programs.bat = {
          enable = true;
          extraPackages = with pkgs.bat-extras; [
            batdiff
            batman
            batgrep
          ];
        };
        home.shellAliases = {
          cat = "bat";
          diff = "batdiff";
        };
        programs.fish.interactiveShellInit = "batman --export-env | source";
      };

    fd.homeManager.programs.fd = {
      enable = true;
    };
    rg.homeManager.programs.ripgrep = {
      enable = true;
    };
    btop.homeManager.programs.btop = {
      enable = true;
    };
    direnv = {
      homeManager.programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
      nixos.programs.direnv.enable = true;
    };
    eza.homeManager.programs.eza = {
      enable = true;
      colors = "auto";
      git = true;
      icons = "auto";
      extraOptions = [
        "--group"
      ];
    };
    yazi.homeManager.programs.yazi = {
      enable = true;
    };
    qalc.homeManager.programs.qalculate = {
      enable = true;
      settings = {
        Mode = {
          calculate_as_you_type = 1;
        };
      };
    };
  };
}
