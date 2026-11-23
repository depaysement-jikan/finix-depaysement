_: {
  hosts = {
    tsukihi = {
      system = "x86_64-linux";
      profile = "desktop";
      platform = "finix";
      users = {
        bird = {
          root.enable = true;
          shell = "nushell";
        };
      };
    };
  };
}
