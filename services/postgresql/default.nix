{
  services = {
    postgresql = {
      enable = true;
      ensureDatabases = ["atuin"];
      ensureUsers = [
        {
          name = "atuin";
          ensureDBOwnership = true;
        }
      ];
    };
  };
}
