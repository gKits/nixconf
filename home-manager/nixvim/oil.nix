{
  programs.nixvim = {
    plugins = {
      oil = {
        enable = true;
        settings = { use_default_keymaps = true; };
      };
    };

    keymaps = [{
      action = "<cmd>Oil<cr>";
      key = "-";
      mode = [ "n" ];
      options = {
        silent = true;
        noremap = true;
        desc = "Open Oil";
      };
    }];
  };
}
