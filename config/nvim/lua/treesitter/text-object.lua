local keymap = require("utils.keymap")
local textobject = require("nvim-treesitter-textobjects")
local incr = require("incr")
local treesj = require("treesj")

textobject.select = require("nvim-treesitter-textobjects.select")
textobject.swap = require("nvim-treesitter-textobjects.swap")

incr.setup({
  incr_key = "<backspace>",
  decr_key = "<leader><backspace>",
})

treesj.setup({ use_default_keymaps = false })

textobject.setup({
  select = { lookahead = true },
  move = { set_jumps = true },
})

keymap.add({ { "<leader>cp", "<cmd>TSJToggle<cr>", "Tree Collapse" } })

keymap.add({
  { "af", { "@function.outer", "textobjects" }, "Around Function" },
  { "if", { "@function.inner", "textobjects" }, "Inner Function" },
  { "ac", { "@class.outer", "textobjects" }, "Around Class" },
  { "ic", { "@class.inner", "textobjects" }, "Inner Class" },
  { "as", { "@local.scope", "local" }, "I don't know" },
}, {
  mode = { "x", "o" },
  cmd_wrapper = function(value)
    return function()
      textobject.select.select_textobject(value[1], value[2])
    end
  end,
})

keymap.add({
  { "n", "swap_next", "Next Parameter" },
  { "p", "swap_previous", "Previous Parameter" },
}, {
  prefix = "<leader>cs",
  group = "Swap",
  cmd_wrapper = function(value)
    return function()
      textobject.swap[value]("@parameter.inner")
    end
  end,
})
