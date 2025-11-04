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

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_user_command("MakeExec", function()
  local file = vim.api.nvim_buf_get_name(0)
  local file_name = vim.fn.shellescape(file)
  if file == "" then
    print("No file to make executable")
    return
  end
  os.execute("chmod +x " .. file_name)
  print("Made " .. file_name .. " executable")
end, {})

function SortOperator(type_or_range, opts)
  local start_pos, end_pos

  if type(type_or_range) == "string" then
    if type_or_range == "char" or type_or_range == "line" then
      start_pos = vim.api.nvim_buf_get_mark(0, "[")
      end_pos = vim.api.nvim_buf_get_mark(0, "]")
    elseif type_or_range == "block" then
      start_pos = vim.api.nvim_buf_get_mark(0, "<")
      end_pos = vim.api.nvim_buf_get_mark(0, ">")
    end
  else
    local range = type_or_range
    start_pos, end_pos = { range.line1, 0 }, { range.line2, 0 }
  end

  if start_pos and end_pos then
    local flags = opts and opts.args or ""
    vim.cmd(string.format("%d,%dsort %s", start_pos[1], end_pos[1], flags))
  end
end

vim.api.nvim_create_user_command("Sort", function(opts)
  if opts.range == 0 then
    vim.o.operatorfunc = "v:lua.SortOperator"
    vim.api.nvim_feedkeys("g@", "n", false)
  else
    SortOperator({ line1 = opts.line1, line2 = opts.line2 }, opts)
  end
end, { range = true, nargs = "*" })
