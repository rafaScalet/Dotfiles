local icons = require("utils.icons")
local picker = require("snacks.picker")
local keymap = require("utils.keymap")

local diagnostic_icons = {
  [vim.diagnostic.severity.ERROR] = icons.lsp.diagnostics.error,
  [vim.diagnostic.severity.WARN] = icons.lsp.diagnostics.warn,
  [vim.diagnostic.severity.INFO] = icons.lsp.diagnostics.info,
  [vim.diagnostic.severity.HINT] = icons.lsp.diagnostics.hint,
}

vim.diagnostic.config({
  jump = { float = true },
  virtual_text = {
    spacing = 4,
    source = "if_many",
    current_line = true,
    prefix = function(diagnostic)
      return diagnostic_icons[diagnostic.severity]
    end,
  },
  severity_sort = true,
  signs = { text = diagnostic_icons },
})

keymap.add({
  {
    "d",
    function()
      local enabled = vim.diagnostic.is_enabled()
      vim.diagnostic.enable(not enabled)
      vim.notify((enabled and "no%s" or "  %s"):format("diagnostic"))
    end,
    "Toggle Diagnostic",
  },
}, { prefix = "<localLeader>" })

keymap.add({
  { "n", vim.diagnostic.goto_next, "Go To Next Diagnostic" },
  { "p", vim.diagnostic.goto_prev, "Go To Previous Diagnostic" },
  { "s", vim.diagnostic.open_float, "Show Diagnostic" },
  { "l", vim.diagnostic.setloclist, "Show Diagnostics In Location List" },
  { "q", vim.diagnostic.setqflist, "Show Diagnostics In Quickfix List" },
}, { prefix = "<leader>d", group = "Diagnostics" })

---@type keymaps.spec[]
local diagnostics_specs = {
  { "a", "ALL", "All" },
  { "i", "INFO", "Info" },
  { "h", "HINT", "Hint" },
  { "w", "WARN", "Warn" },
  { "e", "ERROR", "Error" },
}

local diagnostics_cmd_wrapper = function(value, fn)
  if value == "ALL" then
    return function()
      fn()
    end
  end
  return function()
    fn({
      filter = {
        filter = function(item)
          return item.severity == vim.diagnostic.severity[value]
        end,
      },
    })
  end
end

keymap.add(diagnostics_specs, {
  prefix = "<leader>da",
  group = "All",
  cmd_wrapper = function(value)
    return diagnostics_cmd_wrapper(value, picker.diagnostics)
  end,
})

keymap.add(diagnostics_specs, {
  prefix = "<leader>db",
  group = "Buffer",
  cmd_wrapper = function(value)
    return diagnostics_cmd_wrapper(value, picker.diagnostics_buffer)
  end,
})
