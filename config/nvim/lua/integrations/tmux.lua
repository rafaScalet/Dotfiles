local keymap = require("utils.keymap")

keymap.add({
  { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", "Navigate to Left" },
  { "<c-j>", "<cmd>TmuxNavigateDown<cr>", "Navigate ro Down" },
  { "<c-k>", "<cmd>TmuxNavigateUp<cr>", "Navigate to Up" },
  { "<c-l>", "<cmd>TmuxNavigateRight<cr>", "Navigate to Right" },
  { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", "Navigate to Previous Window" },
})
