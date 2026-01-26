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

keymap.add({
  {
    "l",
    function()
      vim.cmd("set list!")
      local enabled = vim.opt.list:get()
      vim.notify((enabled and "  %s" or "no%s"):format("list"), "help", { title = "Toggle" })
    end,
    "List",
  },
}, {
  prefix = "<localLeader>",
  desc = { prefix = "Toggle " },
})
