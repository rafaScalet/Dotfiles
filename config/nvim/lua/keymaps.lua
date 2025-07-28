local bind = vim.keymap.set
local dt = vim.diagnostic.toggle

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

bind("i", "jj", "<Esc>", { desc = "Exit insert mode with 'jj'" })
bind("i", "jk", "<Esc>", { desc = "Exit insert mode with 'jk'" })
bind("i", "kj", "<Esc>", { desc = "Exit insert mode with 'kj'" })
bind("i", "kk", "<Esc>", { desc = "Exit insert mode with 'kk'" })

bind("n", "<localLeader>Ds", dt.signs, { desc = "Toggle Diagnostic Signs" })
bind("n", "<localLeader>DS", dt.severity_sort, { desc = "Toggle Diagnostic Severity Sort" })
bind("n", "<localLeader>Du", dt.underline, { desc = "Toggle Diagnostic Underline" })
bind("n", "<localLeader>DU", dt.update_in_insert, { desc = "Toggle Diagnostic Update In Insert" })
bind("n", "<localLeader>Dv", dt.virtual_text, { desc = "Toggle Diagnostic Virtual Text" })
bind("n", "<localLeader>DV", dt.virtual_lines, { desc = "Toggle Diagnostic Virtual Lines" })

bind("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Buffer Delete" })
bind("n", "<leader>bD", "<cmd>bdelete!<cr>", { desc = "Buffer Force Delete" })
bind("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Buffer Next" })
bind("n", "<leader>bp", "<cmd>bprev<cr>", { desc = "Buffer Previous" })
bind("n", "<leader>bf", "<cmd>bfirst<cr>", { desc = "Buffer First" })
bind("n", "<leader>bl", "<cmd>blast<cr>", { desc = "Buffer Last" })
bind("n", "<leader>bm", "<cmd>bmodified<cr>", { desc = "Buffer Modified" })
bind("n", "<leader>br", "<cmd>e#<cr>", { desc = "Buffer Recent" })

bind({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy To The Clipboard" })
bind("n", "<leader>Y", '"+Y', { desc = "Copy Line To The Clipboard" })

bind({ "n", "v", "o" }, "B", "^", { desc = "Move to beginning of line" })
bind({ "n", "v", "o" }, "E", "$", { desc = "Move to end of line" })
