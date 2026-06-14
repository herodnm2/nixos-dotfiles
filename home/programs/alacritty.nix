_:

{
  programs.alacritty = {
    enable = true;

    settings = {
      general.import = [
        "~/.config/alacritty/colors.toml"
      ];
      cursor.style = {
        blinking = "On";
        shape = "Beam";
      };

      font = {
        size = 14;

        normal.family = "JetBrainsMono Nerd Font";
      };

      scrolling.history = 100000;

      window = {
        dynamic_padding = true;
        opacity = 1.0;

        padding = {
          x = 12;
          y = 12;
        };
      };

      env.WINIT_UNIX_BACKEND = "wayland";

      general.live_config_reload = true;
    };
  };
}
