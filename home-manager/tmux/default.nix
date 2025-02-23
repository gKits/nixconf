{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    baseIndex = 1;
    terminal = "tmux-256color";
    escapeTime = 0;
    historyLimit = 10000;
    extraConfig = ''
      set-option -sa terminal-features ',xterm-256color:RGB'
      bind-key -T copy-mode-vi v send -X begin-selection
      bind-key -T copy-mode-vi V send -X select-line
      bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel "wl-copy"
    '';
    plugins = with pkgs.tmuxPlugins; [
      sensible
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_date_time "%H:%M"
          set -g @ctp_bg "#000000"
          set -g @catppuccin_window_status_style "rounded"
          set -g @catppuccin_window_default_text " #W"
          set -g @catppuccin_window_current_text " #W"
          set -g @catppuccin_window_status "icon"
          set -g @catppuccin_window_current_background "#{@thm_mauve}"
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
        '';
      }
    ];
  };
}
