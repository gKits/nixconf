{
  programs.nixvim.plugins = {
    dap = {
      enable = true;

      # adapters = {
      #   servers = {
      #     delve = 
      #   };
      # };
    };

    dap-ui = { enable = true; };
  };
}
