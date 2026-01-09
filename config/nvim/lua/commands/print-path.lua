local keymap = require("utils.keymap")

local command = function(opts)
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
end

local complete = function(_, cmdline)
  if #vim.split(cmdline, "%s+") > 2 then
    return {}
  end
  return { "absolute", "home", "relative" }
end

vim.api.nvim_create_user_command("PrintPath", command, {
  nargs = "?",
  complete = complete,
})

keymap.add({
  { "p", "<cmd>PrintPath relative<cr>", "Relative to CWD" },
  { "h", "<cmd>PrintPath home<cr>", "Relative to Home" },
  { "a", "<cmd>PrintPath absolute<cr>", "Absolute" },
}, { prefix = "<leader>p", group = "Print Path" })
