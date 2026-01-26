local icons = require("utils.icons")

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.winborder = "rounded"

vim.opt.laststatus = 3

vim.opt.wrap = true

vim.opt.inccommand = "split"

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.breakindent = true

vim.opt.scrolloff = 5

vim.opt.cursorline = true

vim.opt.undofile = true

vim.opt.swapfile = false

vim.opt.confirm = true

vim.opt.mouse = "a"

vim.opt.signcolumn = "yes"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.list = false
vim.opt.listchars = icons.listchars
vim.opt.fillchars = icons.fillchars
