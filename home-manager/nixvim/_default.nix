{
  imports = [
    ./cmp.nix
    ./conform.nix
    ./dap.nix
    ./git.nix
    ./harpoon.nix
    ./lint.nix
    ./lsp.nix
    ./markdown.nix
    ./neotest.nix
    ./oil.nix
    ./openscad.nix
    ./options.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    colorschemes = {
      catppuccin = {
        enable = true;
        settings = {
          color_overrides = { mocha = { base = "#000000"; }; };
          flavour = "mocha";
          term_colors = true;
        };
      };
    };

    plugins = {
      indent-o-matic.enable = true;
      comment.enable = true;
      dressing.enable = true;
      nvim-autopairs.enable = true;
      todo-comments.enable = true;
      undotree.enable = true;
      web-devicons.enable = true;
      which-key.enable = true;
    };
  };
}
