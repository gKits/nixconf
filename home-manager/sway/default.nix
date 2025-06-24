{ pkgs, lib, ... }: {
  imports = [
    ./kanshi.nix
    ./mako.nix
    ./sway.nix
    ./swaylock.nix
    ./waybar.nix
    ./wofi.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    wlr-randr
    whitesur-icon-theme
    capitaine-cursors
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "sway";
    # XKB_DEFAULT_OPTIONS =
    #   "terminate:ctrl_alt_bksp,caps:escape,altwin:swap_alt_win";
    SDL_VIDEODRIVER = "wayland";

    # needs qt5.qtwayland in systemPackages
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };

  # programs.sway = {
  #   enable = true;
  #   wrapperFeatures = {
  #     base = true;
  #     gtk = true;
  #   };
  #   extraSessionCommands = ''
  #     export SDL_VIDEODRIVER=wayland
  #     export QT_QPA_PLATFORM=wayland
  #     export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
  #     export _JAVA_AWT_WM_NONREPARENTING=1
  #     export SUDO_ASKPASS="${pkgs.ksshaskpass}/bin/ksshaskpass"
  #     export SSH_ASKPASS="${pkgs.ksshaskpass}/bin/ksshaskpass"
  #     export XDG_SESSION_TYPE=wayland
  #     export XDG_CURRENT_DESKTOP=sway
  #   '';
  #   environment.variables = {
  #     XDG_SESSION_TYPE = "wayland";
  #     XDG_CURRENT_DESKTOP = "sway";
  #   };
  # };
}
