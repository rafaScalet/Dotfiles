local keymap = require("utils.keymap")

keymap.add({
  { "<esc>", "<c-n>", "Exit terminal mode with '<Esc>'" },
  { "jj", "<c-n>", "Exit terminal mode with 'jj'" },
  { "jk", "<c-n>", "Exit terminal mode with 'jk'" },
  { "kj", "<c-n>", "Exit terminal mode with 'kj'" },
  { "kk", "<c-n>", "Exit terminal mode with 'kk'" },
}, { mode = "t", prefix = "<c-\\>" })

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
