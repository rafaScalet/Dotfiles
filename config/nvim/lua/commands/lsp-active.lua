local keymap = require("utils.keymap")

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
