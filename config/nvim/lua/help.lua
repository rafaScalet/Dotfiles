vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  desc = "Resize Help Buffers",
  group = vim.api.nvim_create_augroup("ResizeHelp", { clear = true }),
  callback = function()
    vim.cmd("resize 10")
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Create all subfolders for a file",
  group = vim.api.nvim_create_augroup("CreateSubfolders", { clear = true }),
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})
