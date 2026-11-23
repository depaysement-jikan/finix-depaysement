{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf config.finix-generic.desktop.hyprland.enable {
    environment.systemPackages = [
      (pkgs.writeShellScriptBin "switch-monitor" (builtins.readFile ./switch-monitor.sh))
    ];
  };
}
