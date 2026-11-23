{
  lib,
  config,
  ...
}: let
  cfg = config.nixos-generic.desktop;
in {
  imports = [./hyprland ./home-manager ./audio ./tuigreet ./upower];
  options.nixos-generic.desktop = {
    enable = lib.mkEnableOption "Desktop environment";
  };

  config = lib.mkIf cfg.enable {
    nixos-generic.desktop = {
      tuigreet.enable = lib.mkDefault true;
      hyprland.enable = lib.mkDefault true;
      homeManager.enable = lib.mkDefault true;
      audio.enable = lib.mkDefault true;
      upower.enable = lib.mkDefault true;
    };
  };
}
