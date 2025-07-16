local icons = {
  [vim.diagnostic.severity.ERROR] = require("icons").plain.error,
  [vim.diagnostic.severity.WARN] = require("icons").plain.warn,
  [vim.diagnostic.severity.INFO] = require("icons").plain.info,
  [vim.diagnostic.severity.HINT] = require("icons").plain.hint,
}

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = function(diagnostic)
      return icons[diagnostic.severity] .. " "
    end,
  },
  severity_sort = true,
  signs = { text = icons },
})
