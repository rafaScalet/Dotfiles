return {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  cmd = { "Gitsigns" },
  event = { "BufReadPost" },
  opts = { current_line_blame = true },
  keys = {
    { "<leader>gR", "<cmd>Gitsigns refresh<cr>", desc = "Gitsigns Refresh" },
    { "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset" },
    { "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage" },
    { "<leader>ghp", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev" },
    { "<leader>ghn", "<cmd>Gitsigns next_hunk<cr>", desc = "Next" },
    { "<leader>ghN", "<cmd>Gitsigns nav_hunk<cr>", desc = "Navigation" },
    { "<leader>ghP", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview" },

    { "<localLeader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Blame" },
    { "<localLeader>gs", "<cmd>Gitsigns toggle_signs<CR>", desc = "Toggle Signs" },
    { "<localLeader>gl", "<cmd>Gitsigns toggle_linehl<CR>", desc = "Toggle Line HighLight" },
    { "<localLeader>gn", "<cmd>Gitsigns toggle_numhl<CR>", desc = "Toggle Number HighLight" },
    { "<localLeader>gw", "<cmd>Gitsigns toggle_word_diff<CR>", desc = "Toggle Word Diff" },
    { "<localLeader>gd", "<cmd>Gitsigns toggle_deleted<CR>", desc = "Toggle Deleted" },
  },
}
