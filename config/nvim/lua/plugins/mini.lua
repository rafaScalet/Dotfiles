return {
  "echasnovski/mini.nvim",
  lazy = false,
  version = false,
  config = function()
    -- Mini Text Editing
    require("mini.ai").setup({})
    require("mini.comment").setup({
      mappings = {
        -- stylua: ignore start
        comment        = "<leader>cc",
        comment_line   = "<leader>ccc",
        comment_visual = "<leader>cc",
        textobject     = "<leader>cc",
        -- stylua: ignore end
      },
    })
    require("mini.move").setup({})
    require("mini.pairs").setup({})
    require("mini.surround").setup({
      mappings = {
        -- stylua: ignore start
        add            = "<leader>cma", -- Add surrounding in Normal and Visual modes
        delete         = "<leader>cmd", -- Delete surrounding
        find           = "<leader>cmf", -- Find surrounding (to the right)
        find_left      = "<leader>cmF", -- Find surrounding (to the left)
        highlight      = "<leader>cmh", -- Highlight surrounding
        replace        = "<leader>cmr", -- Replace surrounding
        update_n_lines = "<leader>cmn", -- Update `n_lines`
        -- stylua: ignore end
      },
    })

    -- Mini General Workflow
    require("mini.basics").setup({})
    require("mini.files").setup({})
    require("mini.icons").setup({})

    MiniIcons.mock_nvim_web_devicons()

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesActionRename",
      callback = function(event)
        Snacks.rename.on_rename_file(event.data.from, event.data.to)
      end,
    })
  end,
  keys = {
    {
      "<leader>mff",
      function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0))
      end,
      desc = "Current Path",
    },
    {
      "<leader>mfr",
      function()
        MiniFiles.open()
      end,
      desc = "Root Path",
    },
  },
}
