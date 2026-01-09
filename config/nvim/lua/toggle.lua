local boole = require("boole")
local keymap = require("utils.keymap")

boole.setup({
  mappings = {
    increment = "<C-a>",
    decrement = "<C-x>",
  },
})

keymap.add({
  { "<C-a>", "<cmd>Boole increment<cr>", "Increment" },
  { "<C-x>", "<cmd>Boole decrement<cr>", "Decrement" },
})
