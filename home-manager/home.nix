{ inputs, unstable, pkgs, ... }: {

  home.username = "gkits";
  home.homeDirectory = "/home/gkits";

  imports = with inputs; [
    nixvim.homeManagerModules.nixvim

    ./alacritty
    ./fzf
    ./git
    ./nixvim
    ./sway
    ./tmux
    ./zsh
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    arduino
    arduino-ide
    fastfetch
    cmake
    firefox
    gcc
    gnumake
    unstable.go_1_24
    air
    go-task
    templ
    unstable.golangci-lint
    unstable.golangci-lint-langserver
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
    yubioath-flutter

    python3

    unzip
    krita

    unstable.cura-appimage

    forgejo-cli

    unstable.hugo

    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  home.file = { };
  home.sessionVariables = { };

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
