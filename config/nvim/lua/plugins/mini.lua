return {
  "echasnovski/mini.nvim",
  lazy = false,
  version = false,
  config = function()
    require("mini.extra").setup({})
    require("mini.ai").setup({})
    require("mini.comment").setup({})
    require("mini.operators").setup({})
    require("mini.pairs").setup({})
    require("mini.surround").setup({})
    require("mini.bracketed").setup({})
    require("mini.icons").setup({})
    require("mini.git").setup({})
    require("mini.statusline").setup({})
    require("mini.tabline").setup({})
    require("mini.move").setup({})
    -- require("mini.basics").setup({})
    require("mini.cursorword").setup({})

    require("mini.files").setup({
      mappings = {
        close = "<ESC>",
        synchronize = "<CR>",
      },
      options = {
        use_as_default_explorer = true,
      },
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesActionRename",
      callback = function(event)
        Snacks.rename.on_rename_file(event.data.from, event.data.to)
      end,
    })
  end,
  keys = {
    { "<leader>gg", ":Git ", desc = "Invoke Git Command" },
    {
      "-",
      function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0))
      end,
      desc = "Open MiniFiles",
    },
  },
}
