local treesitter = require("nvim-treesitter")

vim.api.nvim_create_user_command("TSListInstalled", function()
  local installed = treesitter.get_installed()

  table.sort(installed)

  vim.notify("- " .. table.concat(installed, "\n- "))
end, {})
