{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    dotDir = ".config/zsh";

    shellAliases = {
      hms = "home-manager switch";
      nv = "nvim";
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
