{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wayland
    xdg-utils
    glib
    grim
    slurp
    lxqt.lxqt-policykit
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  programs.dconf.enable = true;
  programs.light.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "gkits";
      };
    };
  };

  security.polkit.enable = true;
  security.pam.services.swaylock = { };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Enable the gnome-keyring secrets vault.
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;
  services.dbus.enable = true;
}
