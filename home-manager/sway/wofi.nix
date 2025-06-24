{ pkgs, lib, ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      location = "center";
      mode = "drun";
      allow_markup = true;
      term = lib.getExe pkgs.alacritty;
      matching = "fuzzy";
      gtk_dark = true;
      key_down = "Ctrl-j";
      key_up = "Ctrl-k";
      key_left = "Ctrl-h";
      key_right = "Ctrl-l";
    };
    style = ''
      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;


      * {
        font-family: 'FiraCode Mono', monospace;
        font-size: 14px;
      }

      window {
        margin: 0px;
        padding: 10px;
        border: 0.16em solid @lavender;
        border-radius: 0.1em;
        background-color: @base;
        # animation: slideIn 0.5s ease-in-out both;
      }

      @keyframes slideIn {
        0% {
           opacity: 0;
        }

        100% {
           opacity: 1;
        }
      }

      #inner-box {
        margin: 5px;
        padding: 10px;
        border: none;
        background-color: @base;
        # animation: fadeIn 0.5s ease-in-out both;
      }

      @keyframes fadeIn {
        0% {
           opacity: 0;
        }

        100% {
           opacity: 1;
        }
      }

      #outer-box {
        margin: 5px;
        padding: 10px;
        border: none;
        background-color: @base;
      }

      #scroll {
        margin: 0px;
        padding: 10px;
        border: none;
        background-color: @base;
      }

      #input {
        margin: 5px 20px;
        padding: 10px;
        border: none;
        border-radius: 0.1em;
        color: @text;
        background-color: @base;
        # animation: fadeIn 0.5s ease-in-out both;
      }

      #input image {
          border: none;
          color: @red;
      }

      #input * {
        outline: 4px solid @red!important;
      }

      #text {
        margin: 5px;
        border: none;
        color: @text;
        animation: fadeIn 0.5s ease-in-out both;
      }

      #entry {
        background-color: @base;
      }

      #entry arrow {
        border: none;
        color: @lavender;
      }

      #entry:selected {
        border: 0.11em solid @lavender;
      }

      #entry:selected #text {
        color: @mauve;
      }

      #entry:drop(active) {
        background-color: @lavender!important;
      }
    '';
  };

}
