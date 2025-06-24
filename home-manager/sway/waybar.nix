{
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      position = "top";
      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-center = [ "clock#1" "clock#2" "clock#3" ];
      modules-right = [
        "tray"
        "pulseaudio"
        "backlight"
        "memory"
        "cpu"
        "battery"
        "disk"
        # "group/group-power"
      ];

      "sway/workspaces" = {
        all-outputs = true;
        disable-scroll = true;
        disable-click = true;
        format = "{name}";
        sort-by-name = true;
      };

      "group/group-power" = {
        orientation = "inherit";
        drawer = {
          transition-duration = 500;
          children-class = "not-power";
          transition-left-to-right = false;
        };
        modules =
          [ "custom/power" "custom/quit" "custom/lock" "custom/reboot" ];
      };
      "custom/quit" = {
        format = "󰗼";
        tooltip = false;
        on-click = "hyprctl dispatch exit";
      };
      "custom/lock" = {
        format = "󰍁";
        tooltip = false;
        on-click = "swaylock";
      };
      "custom/reboot" = {
        format = "󰜉";
        tooltip = false;
        on-click = "reboot";
      };
      "custom/power" = {
        format = "";
        tooltip = false;
        on-click = "shutdown now";
      };

      tray = {
        icon-size = 21;
        spacing = 10;
      };

      backlight = {
        device = "intel_backlight";
        format = "{icon}";
        format-icons = [ "" "" "" "" "" "" "" "" "" ];
      };

      pulseaudio = {
        scroll-step = 2;
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {icon}";
        format-muted = "";
        format-icons = {
          default = [ "" "" "" ];
          headphones = "";
        };
        on-click = "pavucontrol";
        on-click-right = "pamixer -t";
      };

      "clock#1" = {
        format = "{:%A}";
        tooltip = false;
      };

      "clock#2" = {
        format = "{:%Y %b %d} ";
        tooltip-format = "{calendar}";
        calendar = {
          mode = "month";
          mode-mon-col = 3;
          weeks-pos = "right";
          on-scroll = 1;
          format = {
            weeks = "W{}";
            today = "<u>{}</u>";
          };
        };
        actions = {
          on-click = "mode";
          on-click-middle = "shift_reset";
          on-scroll-up = "shift_up";
          on-scroll-down = "shift_down";
        };
      };
      "clock#3" = {
        format = "{:%H:%M }";
        tooltip = false;
      };

      cpu = {
        interval = 1;
        format = "{}% ";
      };
      memory = {
        interval = 30;
        format = "{used:0.1f}G/{total:0.1f}G ";
        tooltip-format = ''
          {percentage}% memory
          {swapPercentage}% swap'';
      };

      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-icons = [ "" "" "" "" "" ];
        format-charging = "{capacity}%  {icon}";
        format-full = "{capacity}% {icon}";
      };

      disk = {
        interval = 5;
        format = "{percentage_used:2}% ";
        tooltip-format = "{used}/{total}";
        path = "/";
      };
    }];

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
        font-family: FiraCode Mono;
        font-size: 15px;
        min-height: 0;
      }

      #waybar {
        background: #000000;
        color: @text;
        margin: 5px 5px;
      }

      #workspaces {
        border-radius: 0px 1rem 1rem 0px;
        margin: 5px;
        background-color: @surface0;
      }

      #workspaces button {
        color: @lavender;
        border-radius: 1rem;
        padding: 0.4rem;
      }

      #workspaces button.focused {
        color: @sky;
        border-radius: 1rem;
      }

      #workspaces button.urgent {
        color: @red;
        border-radius: 1rem;
      }

      #workspaces button:hover {
        color: @sapphire;
        border-radius: 1rem;
      }

      #backlight,
      #battery,
      #clock,
      #cpu,
      #disk,
      #group-power,
      #memory,
      #pulseaudio,
      #tray {
        background-color: @surface0;
        padding: 0.5rem 1rem;
        margin: 5px 0;
      }

      #clock {
        color: @blue;
        margin-right: 1rem;
        border-radius: 1rem;
        margin-right: 1rem;
      }

      #group-power {
        letter-spacing: 0.5rem;
        margin-right: 1rem;
        border-radius: 1rem;
      }

      #battery {
        color: @green;
      }

      #battery.charging {
        color: @green;
      }

      #battery.warning:not(.charging) {
        color: @red;
      }

      #backlight {
        color: @yellow;
      }

      #backlight, #battery {
          border-radius: 0;
      }

      #pulseaudio {
        color: @maroon;
        border-radius: 1rem 0px 0px 1rem;
        /* margin-left: 1rem; */
      }

      #tray {
        margin-right: 1rem;
        border-radius: 1rem;
      }
    '';
  };
}
