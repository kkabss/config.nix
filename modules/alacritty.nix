{ config, pkgs, lib, ... }:

{

 programs.alacritty = {
  enable = true;

  settings = {
    window = {
      decorations = "full";
      dynamic_title = true;
    };

    font = {
      normal = {
        family = "JetBrainsMono";
      };
      size = 11.0;
    };

    colors = {
      primary = {
        background = "0x1a1b26";
        foreground = "0xc0caf5";
      };

      normal = {
        black =   "0x15161e";
        red =     "0xf7768e";
        green =   "0x9ece6a";
        yellow =  "0xe0af68";
        blue =    "0x7aa2f7";
        magenta = "0xbb9af7";
        cyan =    "0x7dcfff";
        white =   "0xa9b1d6";
      };

      bright = {
        black =   "0x414868";
        red =     "0xf7768e";
        green =   "0x9ece6a";
        yellow =  "0xe0af68";
        blue =    "0x7aa2f7";
        magenta = "0xbb9af7";
        cyan =    "0x7dcfff";
        white =   "0xc0caf5";
      };
    };
  };
};

}
