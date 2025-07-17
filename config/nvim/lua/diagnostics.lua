local diagnostic_icons = {
  [vim.diagnostic.severity.ERROR] = icons.lsp.error,
  [vim.diagnostic.severity.WARN] = icons.lsp.warn,
  [vim.diagnostic.severity.INFO] = icons.lsp.info,
  [vim.diagnostic.severity.HINT] = icons.lsp.hint,
}

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = function(diagnostic)
      return diagnostic_icons[diagnostic.severity]
    end,
  },
  severity_sort = true,
  signs = { text = diagnostic_icons },
})
