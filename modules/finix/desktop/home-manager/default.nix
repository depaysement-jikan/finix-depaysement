{
  config,
  pkgs,
  lib,
  ...
}: {
  options.finix-generic.desktop.homeManager = {
    enable = lib.mkEnableOption "Home Manager";
  };

  config = lib.mkIf config.finix-generic.desktop.homeManager.enable {
    environment.systemPackages = [
      pkgs.home-manager
    ];
  };
}
