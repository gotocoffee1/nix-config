{
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        #"netbios name" = "nas";
        "security" = "user";
        "deadtime" = "30";
        "use sendfile" = "yes";
      };

      "nas" = {
        "path" = "/nas";
        "valid users" = "gotocoffee snow_owlia";
        "public" = "no";
        "writeable" = "yes";
        "hide dot files" = "no";
      };
    };
  };
}
