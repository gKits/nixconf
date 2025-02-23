{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            "[d" = "goto_prev";
            "]d" = "goto_next";
          };
          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<leader>rn" = "rename";
          };
        };

        servers = {
          golangci_lint_ls.enable = true;
          gopls.enable = true;
          html.enable = true;
          htmx.enable = true;
          lua_ls.enable = true;
          nil_ls.enable = true;
          openscad_lsp.enable = true;
          pylsp.enable = true;
          pyright.enable = true;
          tailwindcss.enable = true;
          templ.enable = true;
        };
      };
    };
  };
}
