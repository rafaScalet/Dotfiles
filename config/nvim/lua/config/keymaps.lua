vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<Left>", ":echo 'Use h'<CR>", { silent = true })
vim.keymap.set("n", "<Down>", ":echo 'Use j'<CR>", { silent = true })
vim.keymap.set("n", "<Up>", ":echo 'Use k'<CR>", { silent = true })
vim.keymap.set("n", "<Right>", ":echo 'Use l'<CR>", { silent = true })

vim.keymap.set("i", "jj", "<Esc>", { silent = true, desc = "Exit insert mode with 'jj'" })
vim.keymap.set("i", "jk", "<Esc>", { silent = true, desc = "Exit insert mode with 'jk'" })

vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v", "o" }, "B", "^", { silent = true, desc = "Move to beginning of line" })
vim.keymap.set({ "n", "v", "o" }, "E", "$", { silent = true, desc = "Move to end of line" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { silent = true })
vim.keymap.set("n", "<leader>Y", '"+Y', { silent = true })

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", ";", ":", { noremap = true, desc = "command line" })

vim.keymap.set("n", "<leader>l", function()
  vim.opt.list = not vim.opt.list:get()
end, { desc = "Toggle listchars" })
