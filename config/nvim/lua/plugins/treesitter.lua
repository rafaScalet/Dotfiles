return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  config = function()
    local parsers_path = vim.fn.stdpath("data") .. "/treesitter"
    vim.opt.runtimepath:prepend(parsers_path)
    require("nvim-treesitter.configs").setup({
      modules = {},
      ensure_installed = {
        "awk",
        "bash",
        "diff",
        "gitcommit",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "vim",
        "vimdoc",
      },
      ignore_install = {},
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      parser_install_dir = parsers_path,
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
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "Select around part of a function region" },
            ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
            ["ac"] = { query = "@class.outer", desc = "Select around part of a class region" },
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>csn"] = { query = "@parameter.inner", desc = "Next Parameter" },
          },
          swap_previous = {
            ["<leader>csp"] = { query = "@parameter.inner", desc = "Prev Parameter" },
          },
        },
      },
    })
  end,
}
