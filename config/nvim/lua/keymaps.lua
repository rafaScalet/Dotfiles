local bind = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

bind("i", "jj", "<Esc>", { desc = "Exit insert mode with 'jj'" })
bind("i", "jk", "<Esc>", { desc = "Exit insert mode with 'jk'" })
bind("i", "kj", "<Esc>", { desc = "Exit insert mode with 'kj'" })
bind("i", "kk", "<Esc>", { desc = "Exit insert mode with 'kk'" })

bind("n", "<localLeader>Ds", vim.diagnostic.toggle.signs, { desc = "Toggle Diagnostic Signs" })
bind("n", "<localLeader>DS", vim.diagnostic.toggle.severity_sort, { desc = "Toggle Diagnostic Severity Sort" })
bind("n", "<localLeader>Du", vim.diagnostic.toggle.underline, { desc = "Toggle Diagnostic Underline" })
bind("n", "<localLeader>DU", vim.diagnostic.toggle.update_in_insert, { desc = "Toggle Diagnostic Update In Insert" })
bind("n", "<localLeader>Dv", vim.diagnostic.toggle.virtual_text, { desc = "Toggle Diagnostic Virtual Text" })
bind("n", "<localLeader>DV", vim.diagnostic.toggle.virtual_lines, { desc = "Toggle Diagnostic Virtual Lines" })

bind("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Buffer Delete" })
bind("n", "<leader>bD", "<cmd>bdelete!<cr>", { desc = "Buffer Force Delete" })
bind("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Buffer Next" })
bind("n", "<leader>bp", "<cmd>bprev<cr>", { desc = "Buffer Previous" })
bind("n", "<leader>bf", "<cmd>bfirst<cr>", { desc = "Buffer First" })
bind("n", "<leader>bl", "<cmd>blast<cr>", { desc = "Buffer Last" })
bind("n", "<leader>bm", "<cmd>bmodified<cr>", { desc = "Buffer Modified" })
bind("n", "<leader>br", "<cmd>e#<cr>", { desc = "Buffer Recent" })

bind("n", "<leader>w", "<cmd>w<cr>", { desc = "Write" })
bind("n", "<leader>W", "<cmd>wa<cr>", { desc = "Write All" })
bind("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
bind("n", "<leader>Q", "<cmd>q!<cr>", { desc = "Force Quit" })
bind("n", "<leader>S", "<cmd>wq<cr>", { desc = "Write and Quit" })
bind({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy To The Clipboard" })
bind("n", "<leader>Y", '"+Y', { desc = "Copy Line To The Clipboard" })

bind({ "n", "v", "o" }, "B", "^", { desc = "Move to beginning of line" })
bind({ "n", "v", "o" }, "E", "$", { desc = "Move to end of line" })
