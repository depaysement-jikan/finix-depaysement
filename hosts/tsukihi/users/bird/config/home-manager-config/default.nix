{lib, ...}: {
  options.homeManager.enable = lib.mkEnableOption "Enable home manager module";
  config = {
    homeManager = {
      enable = true;
      apps = {
        enable = true;
        browsers = {
          enable = true;
          zen.enable = false;
          firefox.enable = false;
          floorp.enable = false;
          helium.enable = true;
        };
        social = {
          enable = true;
          discord.enable = true;
          whatsapp.enable = false;
          spotify.enable = false;
        };
        gaming = {
          enable = false;
          steam.enable = false;
          gamescope.enable = false;
        };
        productivity = {
          enable = false;
          obsidian.enable = false;
          sioyek.enable = false;
          qbittorrent.enable = false;
        };
        development = {
          enable = true;
          terminal = {
            enable = true;
            yazi.enable = false;
            zsh.enable = false;
            nushell.enable = true;
            tmux.enable = true;
            git.enable = true;
            ghostty.enable = true;
            foot.enable = false;
            neovim.enable = true;
            starship.enable = true;
            certbot.enable = false;
            doppler.enable = false;
            tuxedo.enable = true;
          };
          api-clients = {
            enable = false;
            yaak.enable = false;
          };
          languages = {
            enable = true;
            go.enable = true;
            node.enable = true;
            markdown.enable = true;
            nix-lang.enable = true;
            sh.enable = true;
            c.enable = true;
            typescript.enable = true;
            lua.enable = true;
            typst.enable = true;
            python.enable = true;
            rust.enable = true;
            zig.enable = true;
            json.enable = true;
            elixir.enable = true;
          };
          ai = {
            enable = false;
            crush.enable = false;
            claude.enable = false;
          };
          db = {
            enable = false;
            postgres.enable = false;
          };
          package-managers = {
            enable = false;
          };
        };
      };
      desktop = {
        enable = true;
        rofi.enable = false;
        wofi.enable = false;
        hyprland.enable = true;
        hyprlock.enable = false;
        waybar.enable = false;
        noctalia.enable = true;
      };
      system = {
        enable = true;
        fonts.enable = true;
        openLinkHub.enable = false;
        themes = {
          enable = true;
          catppuccin.enable = false;
          stylix.enable = false;
        };
        clipboard.enable = true;
      };
      hardware = {
        enable = false;
        qmk.enable = false;
      };
      misc = {
        enable = true;
        cli.enable = true;
      };
    };
  };
}
