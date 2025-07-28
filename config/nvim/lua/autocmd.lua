vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "**/*git/config", "**/*.gitconfig" },
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

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
