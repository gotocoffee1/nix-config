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
  programs.difftastic = {
    enable = true;
    options = {
      display = "side-by-side-show-both";
    };
    git = {
      enable = true;
      diffToolMode = true;
    };
  };
}
