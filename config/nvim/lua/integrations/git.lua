local gitsigns = require("gitsigns")
local picker = require("snacks.picker")
local keymap = require("utils.keymap")

gitsigns.setup({ current_line_blame = true })

keymap.add({
  { "R", "<cmd>Gitsigns refresh<cr>", "Gitsigns Refresh" },
  { "f", picker.git_files, "Files" },
  { "g", picker.git_grep, "Grep" },
  { "S", picker.git_stash, "Stash" },
  { "s", picker.git_status, "Status" },
  { "B", picker.git_branches, "Branches" },
}, { prefix = "<leader>g", group = "Git" })

keymap.add({
  { "f", "<cmd>Gitsigns blame", "File" },
  { "l", "<cmd>Gitsigns blame_line", "Line" },
}, { prefix = "<leader>gb", group = "Blame" })

keymap.add({
  { "f", picker.git_log_file, "Log File" },
  { "l", picker.git_log, "Log" },
}, { prefix = "<leader>gl", group = "Log" })

keymap.add({
  { "l", "<cmd>diffget LOCAL", "Accept Local Changes" },
  { "n", "]c", "Go To Next Diff Hunk" },
  { "p", "[c", "Go To Prev Diff Hunk" },
  { "r", "<cmd>diffget REMOTE", "Accept Remote Changes" },
}, { prefix = "<leader>gd", group = "Diff" })

keymap.add({
  { "N", "<cmd>Gitsigns nav_hunk<cr>", "Navigation" },
  { "P", "<cmd>Gitsigns preview_hunk<CR>", "Preview" },
  { "S", "<cmd>Gitsigns stage_hunk<cr>", "Stage" },
  { "n", "<cmd>Gitsigns next_hunk<cr>", "Next" },
  { "p", "<cmd>Gitsigns prev_hunk<cr>", "Prev" },
  { "r", "<cmd>Gitsigns reset_hunk<cr>", "Reset" },
  { "s", "<cmd>Gitsigns select_hunk<cr>", "Select" },
  { "f", picker.git_diff, "Find" },
}, { prefix = "<leader>gh", group = "Hunk" })

keymap.add({
  { "b", "<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle Blame" },
  { "d", "<cmd>Gitsigns toggle_deleted<CR>", "Toggle Deleted" },
  { "l", "<cmd>Gitsigns toggle_linehl<CR>", "Toggle Line HighLight" },
  { "n", "<cmd>Gitsigns toggle_numhl<CR>", "Toggle Number HighLight" },
  { "s", "<cmd>Gitsigns toggle_signs<CR>", "Toggle Signs" },
  { "w", "<cmd>Gitsigns toggle_word_diff<CR>", "Toggle Word Diff" },
}, { prefix = "<localLeader>g", group = "Git" })

vim.filetype.add({
  pattern = {
    [".*/%.?git/config"] = "gitconfig",
    [".*/%.?git/ignore"] = "gitignore",
  },
})
