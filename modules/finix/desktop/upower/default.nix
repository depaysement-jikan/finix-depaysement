{
  config,
  lib,
  ...
}: {
  options.finix-generic.desktop.upower = {
    enable = lib.mkEnableOption "Upower module";
  };

  config = lib.mkIf config.finix-generic.desktop.upower.enable {
    services.upower.enable = true;
  };
}
