{ inputs, outputs, lib, config, pkgs, ... }: {

  home.username = "gkits";
  home.homeDirectory = "/home/gkits";

  imports = with inputs; [
    nixvim.homeManagerModules.nixvim
    catppuccin.homeManagerModules.catppuccin

    ./alacritty/_default.nix
    ./nixvim/_default.nix
    ./sway/_default.nix
    ./tmux/_default.nix
    ./zsh/_default.nix
  ];

  nixpkgs.config.allowUnfree = true;

  catppuccin.enable = true;

  home.packages = with pkgs; [
    fastfetch
    cmake
    firefox
    gcc
    gnumake
    go
    golangci-lint
    golangci-lint-langserver
    lua
    luarocks
    nerdfonts
    networkmanagerapplet
    nodejs
    openscad-unstable
    ripgrep
    rustup
    ungoogled-chromium
    whatsapp-for-linux

    inputs.unstable.cura-appimage

    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  home.file = { };
  home.sessionVariables = { };

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "gkits";
    userEmail = "gkitsikoudis@gmx.de";
    extraConfig = { init.defaultBranch = "main"; };
  };

  home.stateVersion = "24.11";
}
