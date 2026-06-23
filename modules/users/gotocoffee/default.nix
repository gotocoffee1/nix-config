{ inputs, ... }:
{
  imports = [ (inputs.den.namespace "gtc" false) ];
}
