return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  opts = {
    current_line_blame = true,
  },
  keys = {
    {
      "<leader>gp",
      ":Gitsigns preview_hunk<CR>",
      desc = "Preview Git Hunk",
    },
    {
      "\\gb",
      ":Gitsigns toggle_current_line_blame<CR>",
      desc = "Toggle Git Blame",
    },
    {
      "\\gs",
      ":Gitsigns toggle_signs<CR>",
      desc = "Toggle Git Blame",
    },
  },
}
