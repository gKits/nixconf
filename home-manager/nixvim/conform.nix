{ pkgs, ... }: {
  home.packages = with pkgs; [ nixfmt-classic ];
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;

      settings = {
        formatters_by_ft = {
          go = [ "gofumpt" "goimports" "golines" ];
          templ = [ "goimports" "templ" ];
          lua = [ "stylua" ];
          nix = [ "nixfmt" ];
          python = [ "ruff" ];
        };
        format_on_save = {
          lsp_fallback = true;
          async = false;
          timeout_ms = 1000;
        };
      };
    };
    keymaps = [{
      action =
        "<cmd>lua require('conform').format({lsp_fallback=true,async=false,timeout_ms=1000})<cr>";
      key = "<leader>ff";
      mode = [ "n" "v" ];
      options = {
        silent = true;
        noremap = true;
        desc = "Format current buffer";
      };
    }];
  };
}
