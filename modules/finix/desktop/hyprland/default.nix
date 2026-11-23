{
  config,
  lib,
  ...
}: {
  options.finix-generic.desktop.hyprland.enable = lib.mkEnableOption "hyprland";
  config = lib.mkIf config.finix-generic.desktop.hyprland.enable {
    programs.hyprland.enable = true;
  };
}
