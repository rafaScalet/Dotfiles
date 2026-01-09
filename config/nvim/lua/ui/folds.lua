local ufo = require("ufo")
local keymap = require("utils.keymap")

ufo.setup({})

vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

keymap.add({
  { "R", ufo.openAllFolds, "Open All Folds" },
  { "M", ufo.closeAllFolds, "Close All Folds" },
}, { prefix = "z" })
