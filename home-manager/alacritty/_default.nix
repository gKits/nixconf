{
  imports = [ ./colorscheme.nix ];

  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell = "zsh";
      env.TERM = "xterm-256color";
      font = {
        size = 15;

        normal = {
          family = "FiraCodeNerdFont Mono";
          style = "regular";
        };
        bold = {
          family = "FiraCodeNerdFont Mono";
          style = "bold";
        };
        italic = {
          family = "FiraCodeNerdFont Mono";
          style = "medium";
        };
        bold_italic = {
          family = "FiraCodeNerdFont Mono";
          style = "semibold";
        };
      };
    };
  };
}
