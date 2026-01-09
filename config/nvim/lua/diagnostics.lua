local icons = require("utils.icons")
local picker = require("snacks.picker")
local keymap = require("utils.keymap")

local diagnostic_icons = {
  [vim.diagnostic.severity.ERROR] = icons.lsp.diagnostics.error,
  [vim.diagnostic.severity.WARN] = icons.lsp.diagnostics.warn,
  [vim.diagnostic.severity.INFO] = icons.lsp.diagnostics.info,
  [vim.diagnostic.severity.HINT] = icons.lsp.diagnostics.hint,
}

--- @type vim.diagnostic.Opts
local opts = {
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = function(diagnostic)
      return diagnostic_icons[diagnostic.severity]
    end,
  },
  severity_sort = true,
  signs = { text = diagnostic_icons },
}

local diagnosticToggle = vim.deepcopy(opts)

local M = {}

---@param diagnosticOpts vim.diagnostic.Opts
local function apply(diagnosticOpts)
  vim.diagnostic.config(diagnosticOpts)
end

apply(opts)

local function toggle(key)
  if diagnosticToggle[key] ~= false then
    diagnosticToggle[key] = false
    vim.notify(("no%s (Diagnostic)"):format(key))
  else
    diagnosticToggle[key] = opts[key] == nil and true or opts[key]
    vim.notify(("  %s (Diagnostic)"):format(key))
  end
  apply(diagnosticToggle)
end

M.underline = function()
  toggle("underline")
end
M.signs = function()
  toggle("signs")
end
M.virtual_text = function()
  toggle("virtual_text")
end
M.virtual_lines = function()
  toggle("virtual_lines")
end
M.severity_sort = function()
  toggle("severity_sort")
end
M.update_in_insert = function()
  toggle("update_in_insert")
end

keymap.add({
  { "s", M.signs, "Toggle Signs" },
  { "S", M.severity_sort, "Toggle Severity Sort" },
  { "u", M.underline, "Toggle Underline" },
  { "U", M.update_in_insert, "Toggle Update In Insert" },
  { "v", M.virtual_text, "Toggle Virtual Text" },
  { "V", M.virtual_lines, "Toggle Virtual Lines" },
  {
    "d",
    function()
      local enabled = vim.diagnostic.is_enabled()
      vim.diagnostic.enable(not enabled)
      vim.notify((enabled and "no%s" or "  %s"):format("diagnostic"))
    end,
    "Toggle Diagnostic",
  },
}, { prefix = "<localLeader>d", group = "Diagnostics" })

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

vim.diagnostic.toggle = M
vim.diagnostic.icons = diagnostic_icons
