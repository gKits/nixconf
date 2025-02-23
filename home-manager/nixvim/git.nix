{
  programs.nixvim = {
    plugins = {
      fugitive.enable = true;

      gitsigns.enable = true;

      git-worktree = {
        enable = true;
        enableTelescope = true;
      };
    };

    keymaps = [
      {
        action = "<cmd>Git<cr>";
        key = "<leader>gs";
        mode = [ "n" ];
        options = {
          silent = true;
          noremap = true;
          desc = "Show git status view";
        };
      }
      {
        action =
          "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>";
        key = "<leader>gw";
        mode = [ "n" ];
        options = {
          silent = true;
          noremap = true;
          desc = "Show git worktrees";
        };
      }
    ];
  };
}
