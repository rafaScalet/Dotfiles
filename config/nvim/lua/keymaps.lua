vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with 'jj'" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with 'jk'" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode with 'kj'" })
vim.keymap.set("i", "kk", "<Esc>", { desc = "Exit insert mode with 'kk'" })

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Move to Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "Move to Previous Buffer" })

vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Current Buffer" })

vim.keymap.set({ "n", "v", "o" }, "B", "^", { silent = true, desc = "Move to beginning of line" })
vim.keymap.set({ "n", "v", "o" }, "E", "$", { silent = true, desc = "Move to end of line" })

vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { silent = true })
vim.keymap.set("n", "<leader>Y", '"+Y', { silent = true })

vim.keymap.set({ "n", "x" }, "<leader>d", '"+d', { silent = true })

vim.keymap.set("x", "<leader>p", '"_dP')
