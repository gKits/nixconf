{ lib, pkgs, ... }: {
  programs.swaylock = {
    enable = true;
    settings = {
      color = "00000000";
      font = "Sans";
      indicator-radius = "120";
      indicator-thickness = "60";
      indicator-caps-lock = true;
      inside-color = "009ddc00";
      inside-clear-color = "ffd20400";
      inside-caps-lock-color = "009ddc00";
      inside-ver-color = "d9d8d800";
      inside-wrong-color = "ee2e2400";
      ring-color = "231f20D9";
      ring-clear-color = "231f20D9";
      ring-caps-lock-color = "231f20D9";
      ring-ver-color = "231f20D9";
      ring-wrong-color = "231f20D9";
      line-color = "009ddc00";
      line-clear-color = "ffd204FF";
      line-caps-lock-color = "009ddcFF";
      line-ver-color = "d9d8d8FF";
      line-wrong-color = "ee2e24FF";
      text-color = "009ddc00";
      text-clear-color = "ffd20400";
      text-caps-lock-color = "009ddc00";
      text-ver-color = "d9d8d800";
      text-wrong-color = "ee2e2400";
      key-hl-color = "009ddcFF";
      bs-hl-color = "ee2e24FF";
      caps-lock-key-hl-color = "ffd204FF";
      caps-lock-bs-hl-color = "ee2e24FF";
      separator-color = "231f2000";
    };
  };
  services.swayidle = {
    enable = true;
    timeouts = [{
      timeout = 180;
      command = lib.getExe pkgs.swaylock;
    }];
    events = [{
      event = "before-sleep";
      command = lib.getExe pkgs.swaylock;
    }];
  };
}
