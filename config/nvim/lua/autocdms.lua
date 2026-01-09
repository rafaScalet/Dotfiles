vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "**/Dockerfile*",
  callback = function()
    vim.bo.filetype = "dockerfile"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "**/.env.*" },
  callback = function()
    vim.bo.filetype = "sh"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "**/swag.conf" },
  callback = function()
    vim.bo.filetype = "nginx"
  end,
})
