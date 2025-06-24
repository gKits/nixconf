{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    dotDir = ".config/zsh";

    shellAliases = {
      hms = "home-manager switch";
      tmux-session = ''
        bash '
               if [[ $# -eq 1 ]]; then
                   selected=$1
               else
                   selected=$(find ~/ ~/repos ~/cad -mindepth 1 -maxdepth 1 -type d | fzf)
               fi

               if [[ -z $selected ]]; then
                   exit 0
               fi

               selected_name=$(basename "$selected" | tr . _)
               tmux_running=$(pgrep tmux)

               if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
                   tmux new-session -s $selected_name -c $selected
                   exit 0
               fi

               if ! tmux has-session -t=$selected_name 2> /dev/null; then
                   tmux new-session -ds $selected_name -c $selected
               fi

               if tmux server-info 2> /dev/null; then
                   tmux switch-client -t $selected_name
               fi

               tmux attach -client -t $selected_name '
      '';
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "web-search" "fzf" ];
    };
    plugins = [
      # # Autocompletions
      # {
      #   name = "zsh-autosuggestions";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "zsh-users";
      #     repo = "zsh-autosuggestions";
      #     rev = "v0.7.1";
      #     hash = "sha256-vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
      #   };
      # }
      # # Completion scroll
      # {
      #   name = "zsh-completions";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "zsh-users";
      #     repo = "zsh-completions";
      #     rev = "0.35.0";
      #     hash = "sha256-GFHlZjIHUWwyeVoCpszgn4AmLPSSE8UVNfRmisnhkpg=";
      #   };
      # }
      # # Highlight commands in terminal
      # {
      #   name = "zsh-syntax-highlighting";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "zsh-users";
      #     repo = "zsh-syntax-highlighting";
      #     rev = "0.8.0";
      #     hash = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
      #   };
      # }
    ];
  };
}
