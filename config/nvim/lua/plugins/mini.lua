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
        comment        = "<leader>mc",
        comment_line   = "<leader>mcc",
        comment_visual = "<leader>mc",
        textobject     = "<leader>mc",
        -- stylua: ignore end
      },
    })
    require("mini.move").setup({})
    require("mini.pairs").setup({})
    require("mini.surround").setup({
      mappings = {
        -- stylua: ignore start
        add            = "<leader>msa", -- Add surrounding in Normal and Visual modes
        delete         = "<leader>msd", -- Delete surrounding
        find           = "<leader>msf", -- Find surrounding (to the right)
        find_left      = "<leader>msF", -- Find surrounding (to the left)
        highlight      = "<leader>msh", -- Highlight surrounding
        replace        = "<leader>msr", -- Replace surrounding
        update_n_lines = "<leader>msn", -- Update `n_lines`
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
