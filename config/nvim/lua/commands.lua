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
  pattern = { "**/*git/ignore", "**/*.gitignore" },
  callback = function()
    vim.bo.filetype = "gitignore"
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

vim.api.nvim_create_user_command("LspActive", function(opts)
  local args = opts.args ~= "" and opts.args or "all"
  local title = "Active LSPs "

  local handlers = {
    all = {
      value = vim.lsp.get_clients(),
      title = title .. "(all)",
    },
    buffer = {
      value = vim.lsp.get_clients({ bufnr = 0 }),
      title = title .. "(active buffer)",
    },
  }

  local clients = handlers[args]

  if not clients then
    vim.notify(("Invalid argument: %s"):format(args), vim.log.levels.ERROR, { title = title })
    return
  end

  if vim.tbl_isempty(clients.value) then
    vim.notify("No active LSP clients", vim.log.levels.INFO, { title = clients.title })
    return
  end

  local lsp_list = {}

  for _, c in ipairs(clients.value) do
    table.insert(lsp_list, "- " .. c.name)
  end

  vim.notify(table.concat(lsp_list, "\n"), vim.log.levels.INFO, { title = clients.title })
end, {
  nargs = "?",
  complete = function(_, cmdline)
    if #vim.split(cmdline, "%s+") > 2 then
      return {}
    end
    return { "all", "buffer" }
  end,
})

vim.api.nvim_create_user_command("PrintPath", function(opts)
  local args = opts.args ~= "" and opts.args or "relative"

  local handlers = {
    absolute = vim.fn.expand("%:p:/"),
    home = vim.fn.expand("%:p:~"),
    relative = vim.fn.expand("%:p:."),
  }

  local value = handlers[args]

  if not value then
    vim.notify("Uso: :PrintPath [absolute|home|relative]", vim.log.levels.WARN, { title = "PrintPath" })
    return
  end

  vim.notify(value, vim.log.levels.INFO, { title = "PrintPath" })
end, {
  nargs = "?",
  complete = function(_, cmdline)
    if #vim.split(cmdline, "%s+") > 2 then
      return {}
    end
    return { "absolute", "home", "relative" }
  end,
})

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
