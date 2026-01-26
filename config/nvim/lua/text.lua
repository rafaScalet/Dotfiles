local keymap = require("utils.keymap")
local ai = require("mini.ai")
local move = require("mini.move")
local pairs = require("mini.pairs")
local surround = require("mini.surround")
local textcase = require("textcase")

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  desc = "Highlight the yanked text",
  group = vim.api.nvim_create_augroup("HighlightTextYank", {}),
  callback = function()
    vim.highlight.on_yank()
  end,
})

ai.setup({})

move.setup({})

pairs.setup({})

surround.setup({
  -- stylua: ignore start
  mappings = {
    add = "<leader>cma",            -- Add surrounding in Normal and Visual modes
    delete = "<leader>cmd",         -- Delete surrounding
    find = "<leader>cmf",           -- Find surrounding (to the right)
    find_left = "<leader>cmF",      -- Find surrounding (to the left)
    highlight = "<leader>cmh",      -- Highlight surrounding
    replace = "<leader>cmr",        -- Replace surrounding
    update_n_lines = "<leader>cmn", -- Update `n_lines`
  },
  -- stylua: ignore end
})

keymap.wk({ { "<leader>cm", group = "Surrounding", mode = { "n", "v" } } })

local cases = {
  { "u", "to_upper_case", "UPPER CASE" },
  { "l", "to_lower_case", "lower case" },
  { "s", "to_snake_case", "snake_case" },
  { "k", "to_dash_case", "kebab-case" },
  { "n", "to_constant_case", "CONSTANT_CASE" },
  { ".", "to_dot_case", "dot.case" },
  { ",", "to_comma_case", "comma,case" },
  { "a", "to_phrase_case", "Phrase case" },
  { "c", "to_camel_case", "camelCase" },
  { "p", "to_pascal_case", "PascalCase" },
  { "r", "to_title_case", "Title Case" },
  { "f", "to_path_case", "path/case" },
}

textcase.setup({ default_keymappings_enabled = false })

keymap.add(cases, {
  prefix = "<leader>ca",
  group = "Text Case",
  cmd_wrapper = function(value)
    return function()
      textcase.operator(value)
    end
  end,
})

keymap.add(cases, {
  prefix = "<leader>cal",
  group = "LSP",
  cmd_wrapper = function(value)
    return function()
      textcase.lsp_rename(value)
    end
  end,
})

keymap.add(cases, {
  prefix = "<leader>caw",
  group = "Word",
  cmd_wrapper = function(value)
    return function()
      textcase.current_word(value)
    end
  end,
})
