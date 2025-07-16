vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Highlight yank",
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "**/*git/config",
  callback = function()
    vim.bo.filetype = "gitconfig"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "**/Dockerfile*",
  callback = function()
    vim.bo.filetype = "dockerfile"
  end,
})
