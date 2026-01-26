local snacks = require("snacks")
local highlight = require("nvim-highlight-colors")
local icons = require("mini.icons")
local flash = require("flash")
local keymap = require("utils.keymap")

flash.setup({
  modes = {
    search = { enabled = true },
    char = { jump_labels = true },
  },
})

icons.setup({})

icons.mock_nvim_web_devicons()

highlight.setup({})

snacks.setup({
  notifier = { enabled = true },
  statuscolumn = {
    enabled = true,
    folds = { git_hl = true, open = true },
  },
  picker = { enabled = true, icons = { files = { enabled = false } } },
  words = { enabled = true },
  image = { enabled = true },
  explorer = {
    replace_netrw = true,
    trash = true,
  },
})

keymap.add({
  {
    "f",
    function()
      local enabled = flash.toggle()
      vim.notify((enabled and "no%s" or "  %s"):format("flash"))
    end,
    "Toggle Flash Search",
  },
  {
    "m",
    function()
      local enabled = snacks.dim.enabled
      if enabled then
        snacks.dim.disable()
      else
        snacks.dim.enable()
      end
      vim.notify((enabled and "no%s" or "  %s"):format("dim"))
    end,
    "Toggle Dim",
  },
}, { prefix = "<localLeader>" })
