local mason = require("mason")
local registry = require("mason-registry")
local icons = require("utils.icons")

local M = {}

mason.setup({
  ui = {
    icons = {
      package_installed = icons.package.installed,
      package_pending = icons.package.pending,
      package_uninstalled = icons.package.uninstalled,
    },
  },
})

---@param tools string[] tools to be installed with mason.nvim
function M.add(tools)
  local log = vim.log.levels
  local title = { title = "mason.nvim" }

  ---@type fun(msg: string, level: vim.log.levels, opts: table)
  local show = vim.schedule_wrap(function(msg, level, opts)
    vim.notify(msg, level, opts)
  end)

  registry.refresh()

  for _, tool in ipairs(tools) do
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
end

return M
