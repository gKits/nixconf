{ inputs, lib, config, pkgs, ... }: {
  imports = [
    inputs.hardware.nixosModules.framework-13th-gen-intel
    ./hardware-configuration.nix
    ./window-manager.nix
  ];

  # Enable flakes 
  nix = let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      nix-path = config.nix.nixPath;
      auto-optimise-store = true;
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;

    gc = {
      automatic = true;
      options = "--delete-older-than +5";
    };
  };
  nixpkgs.config.allowUnfree = true;

  # Networking
  networking = {
    hostName = "framework13";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      # allowedUDPPorts = [...];
      # allowedTCPPorts = [...];
    };
    extraHosts = ''
      192.168.178.100 traefik.gkits.local hub.gkits.local status.gkits.local prowlarr.gkits.local radarr.gkits.local lidarr.gkits.local readarr.gkits.local bazarr.gkits.local sonarr.gkits.local request.gkits.local
    '';
  };
  time.timeZone = "Europe/Berlin";

  # User configs
  users.users.gkits = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "adbusers" "dialout" ];
    shell = pkgs.zsh;
    initialPassword = "";
    packages = with pkgs; [ heimdall ];
  };

  # Packages & Programs
  environment.systemPackages = with pkgs; [ docker-compose ];

  programs.zsh.enable = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  # programs.adb.enable = true;
  # programs.smartmontools.enable = true;

  services.tlp.enable = true;
  services.printing.enable = true;
  services.pcscd.enable = true;
  services.ntp = {
    enable = true;
    servers = [
      "0.de.pool.ntp.org"
      "1.de.pool.ntp.org"
      "2.de.pool.ntp.org"
      "3.de.pool.ntp.org"
    ];
  };

  services.udev.packages = [ pkgs.android-udev-rules ];

  # Optimizations
  ## SSD
  services.fstrim.enable = lib.mkDefault true;
  ## Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  ## Video
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  # Docker
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # Boot Loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth = {
    enable = true;
    themePackages = [ pkgs.catppuccin-plymouth ];
  };

  # Swap
  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024;
  }];

  system.stateVersion = "24.11";
}
