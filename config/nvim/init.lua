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

require("icons")
require("keymaps")
require("options")
require("autocmd")
require("diagnostics")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.mason" },
    { import = "plugins.ui" },
  },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
  ui = {
    icons = {
      loaded = I.package.enabled,
      not_loaded = I.package.disabled,
      cmd = I.terminal,
      plugin = I.package.i,
      event = I.rocket,
      require = I.package.dependencies,
      start = I.play,
      source = I.source,
      keyboard = I.keyboard,
    },
  },
})
