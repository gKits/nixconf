{
  programs.nixvim.plugins = {
    neotest = {
      enable = true;

      settings = {
        output = {
          enabled = true;
          open_on_run = true;
        };
        output_panel = {
          enabled = true;
          open = "botright split | resize 15";
        };
        quickfix = { enabled = false; };
      };
    };
  };
}
