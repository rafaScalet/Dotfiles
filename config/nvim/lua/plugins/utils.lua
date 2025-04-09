return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {},
    keys = { { "<leader>t", ":ToggleTerm direction=float<CR>", desc = "Open up a floating terminal" } },
  },
  { "echasnovski/mini.pairs", opts = {} },
  { "echasnovski/mini.comment", opts = {} },
  { "echasnovski/mini.tabline", opts = {} },
  { "tpope/vim-sleuth" },
}
