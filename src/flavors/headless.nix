{
  system.nixos.tags = [ "headless" ];
  envFeatures = {
    gui.enable = false;
    ssh.enable = true;
  };
}

