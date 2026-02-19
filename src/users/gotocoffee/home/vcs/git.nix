{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "gotocoffee1@gmail.com";
        name = "gotocoffee";
      };
      pull = {
        ff = true;
      };
    };
  };
}
