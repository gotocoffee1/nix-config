{ config, ... }:
let
  gui = config.homeFeatures.gui;
in
{
  programs.keepassxc = {
    enable = gui.enable;
    settings = {
      PasswordGenerator = {
        LowerCase = true;
        UpperCase = true;
        Numbers = true;
        SpecialChars = true;
        Braces = true;
        Punctuation = true;
        Quotes = true;
        Dashes = true;
        Math = true;
      };
    };
  };
}
