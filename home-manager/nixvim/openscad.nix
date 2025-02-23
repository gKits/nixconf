{ pkgs, ... }: {
  home.packages = with pkgs; [ zathura htop ];
  programs.nixvim = {
    plugins.openscad = {
      enable = true;
      settings = {
        auto_open = true;
        fuzzy_finder = "fzf";
        load_snippets = true;
        default_mappings = true;
        # cheatsheet_toggle_key = "<C-h>";
        # exec_openscad_trig_key = "<F2>";
      };
    };
  };
}
