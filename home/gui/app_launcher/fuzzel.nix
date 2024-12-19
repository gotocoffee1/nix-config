{...}:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        prompt = "\"󱞩 \"";
        exit-on-keyboard-focus-loss = true;
      };
    };
  };
}
