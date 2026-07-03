{ isMainUser, profile, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  features = config.envFeatures;
in
{
  users.users.gotocoffee = {
  };

}
