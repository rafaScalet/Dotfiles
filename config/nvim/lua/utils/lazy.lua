local icons = require("utils.icons")

local M = {}
local plugins = {}

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

---@param spec LazySpec
M.add = function(spec)
  table.insert(plugins, spec)
end

M.install = function()
  local lazy = require("lazy")

  lazy.setup({
    spec = plugins,
    install = { colorscheme = { "catppuccin" } },
    checker = { enabled = true, notify = false },
    change_detection = { notify = false },
  })

  lazy.clean({ show = false })
end

return M
