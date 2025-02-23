{
  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    extraConfig = ''
      [urgency=high]
      ignore-timeout = 1
    '';
  };
}
