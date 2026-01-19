local mason = require("mason")
local registry = require("mason-registry")
local icons = require("utils.icons")

local M = {}
local desired = {}
local scheduled = false

mason.setup({
  ui = {
    icons = {
      package_installed = icons.package.installed,
      package_pending = icons.package.pending,
      package_uninstalled = icons.package.uninstalled,
    },
  },
})

---@param msg string
---@param level vim.log.levels
---@param opts table
local show = vim.schedule_wrap(function(msg, level, opts)
  vim.notify(msg, level, opts)
end)

local function sync()
  local log = vim.log.levels
  local title = { title = "mason.nvim" }

  registry.refresh()

  for tool, _ in pairs(desired) do
    local ok, pkg = pcall(registry.get_package, tool)
    if not ok then
      show("tool not found: " .. tool, log.WARN, title)
      goto continue
    end

    if not pkg:is_installable() then
      show("isn't possible to install " .. tool, log.WARN, title)
      goto continue
    end

    if not pkg:is_installed() then
      show("installing " .. tool, log.INFO, title)

      pkg:once("install:success", function()
        show(tool .. " was successfully installed", log.INFO, title)
      end)

      pkg:once("install:failed", function()
        show(tool .. " failed to install ", log.ERROR, title)
      end)

      pkg:install()
    end

    ::continue::
  end

  for _, pkg in ipairs(registry.get_installed_packages()) do
    local tool = pkg.name

    if not desired[tool] then
      show("removing " .. tool, log.INFO, title)

      pkg:once("uninstall:success", function()
        show(tool .. " was successfully uninstalled", log.INFO, title)
      end)

      pkg:once("uninstall:failed", function()
        show(tool .. " failed to uninstall", log.ERROR, title)
      end)

      pkg:uninstall()
    end
  end
end

---@param tools string[] tools to be installed with mason.nvim
function M.add(tools)
  for _, tool in ipairs(tools) do
    desired[tool] = true
  end

  if not scheduled then
    scheduled = true

    vim.schedule(sync)
  end
end

return M
