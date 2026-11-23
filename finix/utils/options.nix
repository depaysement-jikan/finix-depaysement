{lib, ...}: let
  inherit (lib) types;
in {
  options.hosts = lib.mkOption {
    type = types.attrsOf (
      types.submodule {
        options = {
          system = lib.mkOption {
            type = types.enum [
              "x86_64-linux"
            ];
          };
          profile = lib.mkOption {
            type = types.enum [
              "desktop"
              "server"
            ];
          };
          platform = lib.mkOption {
            type = types.enum [
              "finix"
            ];
          };
          users = lib.mkOption {
            type = types.attrsOf (
              types.submodule (
                {name, ...}: {
                  options = {
                    root.enable = lib.mkEnableOption "root access";
                    home = lib.mkOption {
                      type = types.str;
                      default = "/home/${name}";
                    };
                    shell = lib.mkOption {
                      type = types.enum [
                        "bash"
                        "zsh"
                        "fish"
                        "nushell"
                      ];
                    };
                  };
                }
              )
            );
            default = {};
          };
        };
      }
    );
    default = {};
  };
}
