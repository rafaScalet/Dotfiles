vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("HelpReplaceWindow", { clear = true }),
  callback = function()
    if vim.bo.filetype == "help" and vim.b.already_opened == nil then
      vim.b.already_opened = true
      local original_win = vim.fn.win_getid(vim.fn.winnr("#"))
      local help_win = vim.api.nvim_get_current_win()
      if original_win ~= help_win then
        vim.api.nvim_win_close(original_win, false)
      end
      vim.bo.buflisted = true
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.keymap.set("n", "q", "<cmd>tabclose<CR>", { buffer = true })
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
