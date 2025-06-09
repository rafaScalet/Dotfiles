return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Backspace>",
          node_incremental = "<Backspace>",
          scope_incremental = false,
          node_decremental = "<leader><Backspace>",
        },
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "Select the entire function" },
            ["if"] = { query = "@function.inner", desc = "Select the inner content of a function" },
            ["ac"] = { query = "@class.outer", desc = "select the entire class" },
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            ["aC"] = { query = "@comment.outer", desc = "Select the entire comment" },
          },
          include_surrounding_whitespace = true,
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
    })
  end,
}
