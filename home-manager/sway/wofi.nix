{ pkgs, lib, ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      location = "center";
      mode = "drun,run";
      allow_markup = true;
      term = lib.getExe pkgs.alacritty;
      matching = "fuzzy";
      gtk_dark = true;
      key_down = "Ctrl-j";
      key_up = "Ctrl-k";
      key_left = "Ctrl-h";
      key_right = "Ctrl-l";
    };
  };

}
