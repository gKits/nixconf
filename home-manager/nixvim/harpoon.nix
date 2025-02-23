{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;

      keymapsSilent = true;

      keymaps = {
        addFile = "<leader>ha";
        toggleQuickMenu = "<leader>hh";
      };
    };
  };
}
