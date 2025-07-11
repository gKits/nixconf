{ pkgs, lib, ... }:
let mod = "Mod4";
in {
  wayland.windowManager.sway = {
    extraSessionCommands = ''
      unset __NIXOS_SET_ENVIRONMENT_DONE
    '';

    enable = true;
    config = {
      fonts = {
        names = [ "FiraCode Mono" ];
        size = 11.0;
      };
      terminal = lib.getExe pkgs.alacritty;
      menu = lib.getExe pkgs.wofi;
      bars = [{ command = lib.getExe pkgs.waybar; }];

      modifier = mod;

      input = {
        "*" = {
          xkb_layout = "de";
          xkb_variant = "us";
        };
      };

      keybindings = lib.mkOptionDefault {
        "${mod}+less" = "move workspace to output left";
        "${mod}+greater" = "move workspace to output right";
      };
    };
  };
}
