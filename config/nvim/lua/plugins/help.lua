return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "shahshlok/vim-coach.nvim",
    dependencies = { "folke/snacks.nvim" },
    otps = {},
    keys = { { "<leader>?", "<cmd>VimCoach<cr>", desc = "Vim Coach" } },
  },
}
