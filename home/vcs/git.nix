{...}:
{
  programs.git = {
    enable = true;
    userEmail = "gotocoffee1@gmail.com";
    userName = "gotocoffee";
    extraConfig = {
      pull = {
        ff = true;
      };
    };
  };
}

