local keymap = require("utils.keymap")

keymap.add({
  { "<esc>", "<c-\\><c-n>", "Exit terminal mode with '<Esc>'" },
  { "jj", "<c-\\><c-n>", "Exit terminal mode with 'jj'" },
  { "jk", "<c-\\><c-n>", "Exit terminal mode with 'jk'" },
  { "kj", "<c-\\><c-n>", "Exit terminal mode with 'kj'" },
  { "kk", "<c-\\><c-n>", "Exit terminal mode with 'kk'" },
}, { mode = "t" })

keymap.add({
  { "t", "<cmd>terminal<cr>", "Open a New Terminal Buffer" },
  {
    "T",
    function()
      vim.cmd.new()
      vim.api.nvim_win_set_height(0, 12)
      vim.cmd.term()
    end,
    "Open a New Terminal Split",
  },
}, { prefix = "<leader>" })

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = vim.api.nvim_create_augroup("TerminalOpen", { clear = true }),
  pattern = "term://*",
  desc = "Pretty sensible defaults only for terminal buffers",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0

    vim.cmd("startinsert")
  end,
})
