{
  gtc.shell.homeManager.programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    plugins = [
    ];
  };
}
