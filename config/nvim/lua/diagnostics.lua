local icons = {
  [vim.diagnostic.severity.ERROR] = I.lsp.diagnostics.error,
  [vim.diagnostic.severity.WARN] = I.lsp.diagnostics.warn,
  [vim.diagnostic.severity.INFO] = I.lsp.diagnostics.info,
  [vim.diagnostic.severity.HINT] = I.lsp.diagnostics.hint,
}

--- @type vim.diagnostic.Opts
local opts = {
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = function(diagnostic)
      return icons[diagnostic.severity]
    end,
  },
  severity_sort = true,
  signs = { text = icons },
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

vim.diagnostic.toggle = M
vim.diagnostic.icons = icons
