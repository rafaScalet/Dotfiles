return {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  cmd = { "Gitsigns" },
  event = { "BufReadPost" },
  opts = { current_line_blame = true },
  keys = {
    { "<leader>gR", "<cmd>Gitsigns refresh<cr>", desc = "Gitsigns Refresh" },

    { "<leader>gbf", "<cmd>Gitsigns blame", desc = "File" },
    { "<leader>gbl", "<cmd>Gitsigns blame_line", desc = "Line" },

    { "<leader>gdl", "<cmd>diffget LOCAL", desc = "Accept Local Changes" },
    { "<leader>gdn", "]c", desc = "Go To Next Diff Hunk" },
    { "<leader>gdp", "[c", desc = "Go To Prev Diff Hunk" },
    { "<leader>gdr", "<cmd>diffget REMOTE", desc = "Accept Remote Changes" },

    { "<leader>ghN", "<cmd>Gitsigns nav_hunk<cr>", desc = "Navigation" },
    { "<leader>ghP", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview" },
    { "<leader>ghS", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage" },
    { "<leader>ghn", "<cmd>Gitsigns next_hunk<cr>", desc = "Next" },
    { "<leader>ghp", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev" },
    { "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset" },
    { "<leader>ghs", "<cmd>Gitsigns select_hunk<cr>", desc = "Select" },

    { "<localLeader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Blame" },
    { "<localLeader>gd", "<cmd>Gitsigns toggle_deleted<CR>", desc = "Toggle Deleted" },
    { "<localLeader>gl", "<cmd>Gitsigns toggle_linehl<CR>", desc = "Toggle Line HighLight" },
    { "<localLeader>gn", "<cmd>Gitsigns toggle_numhl<CR>", desc = "Toggle Number HighLight" },
    { "<localLeader>gs", "<cmd>Gitsigns toggle_signs<CR>", desc = "Toggle Signs" },
    { "<localLeader>gw", "<cmd>Gitsigns toggle_word_diff<CR>", desc = "Toggle Word Diff" },
  },
}
