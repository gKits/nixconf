{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      settings.defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
        ];
        set_env.COLORTERM = "truecolor";
        mappings = {
          i = {
            "<C-j>" = {
              __raw = "require('telescope.actions').move_selection_next";
            };
            "<C-k>" = {
              __raw = "require('telescope.actions').move_selection_previous";
            };
          };
        };
      };

      keymaps = {
        "<leader>sf" = {
          action = "find_files";
          options.desc = "file search in current working directory";
        };
        "<leader>sp" = {
          action = "git_files";
          options.desc = "file search in current git project";
        };
        "<leader>sg" = {
          action = "live_grep";
          options.desc = "live grep search";
        };
        "<leader>sd" = {
          action = "diagnostics";
          options.desc = "search over diagnostics messages";
        };
        "<leader>sk" = {
          action = "keymaps";
          options.desc = "search keymaps";
        };
        "<leader><leader>" = {
          action = "buffers";
          options.desc = "search over open buffers";
        };
        "gi" = {
          action = "lsp_implementations";
          options.desc = "LSP buf implementations (Telescope)";
        };
        "gr" = {
          action = "lsp_references";
          options.desc = "LSP buf references (Telescope)";
        };
      };
    };
  };
}
