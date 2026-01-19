local keymap = require("utils.keymap")

keymap.add({
  { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", "Navigate to Left" },
  { "<c-j>", "<cmd>TmuxNavigateDown<cr>", "Navigate ro Down" },
  { "<c-k>", "<cmd>TmuxNavigateUp<cr>", "Navigate to Up" },
  { "<c-l>", "<cmd>TmuxNavigateRight<cr>", "Navigate to Right" },
  { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", "Navigate to Previous Window" },
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "**/*.tmux" },
  callback = function()
    vim.bo.filetype = "tmux"
  end,
})
