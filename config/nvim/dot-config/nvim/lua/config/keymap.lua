vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "jj", "<Esc>", { silent = true, desc = "Exit insert mode with 'jj'" })
vim.keymap.set("i", "jk", "<Esc>", { silent = true, desc = "Exit insert mode with 'jk'" })

vim.keymap.set("n", "<leader>fo", ":Format<CR>", { silent = true, desc = "Format current file" })

vim.keymap.set({ "n", "v", "o" }, "B", "^", { silent = true, desc = "Move to beginning of line" })
vim.keymap.set({ "n", "v", "o" }, "E", "$", { silent = true, desc = "Move to end of line" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader><CR>", ":", { noremap = true, desc = "command line" })

vim.keymap.set("n", "<leader>l", function()
  vim.opt.list = not vim.opt.list:get()
end, { desc = "Toggle listchars" })
