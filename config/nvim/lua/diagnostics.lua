local diagnostic_icons = {
  [vim.diagnostic.severity.ERROR] = I.lsp.diagnostics.error,
  [vim.diagnostic.severity.WARN] = I.lsp.diagnostics.warn,
  [vim.diagnostic.severity.INFO] = I.lsp.diagnostics.info,
  [vim.diagnostic.severity.HINT] = I.lsp.diagnostics.hint,
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
