local M = {}

local loaded_modules = {}
local ignored_modules = {}
local base_path = vim.fs.joinpath(vim.fn.stdpath("config"), "lua")
local ignore_patterns = {}

--- checks wether the module should be ignored, and ensure consistency for globs
--- @param module string
--- @return boolean
local function should_ignore(module)
  for _, pattern in ipairs(ignore_patterns) do
    pattern = pattern:match("%.%*") and pattern .. "%..*" or pattern
    if module:match("^" .. pattern .. "$") then
      return true
    end
  end

  return false
end

--- convert a path in FS to a lua module. e.g "code/lsp.lua" to "code.lsp"
--- @param module_path string
--- @return string
local function convert_path_to_module(module_path)
  module_path = module_path:gsub("%.lua$", "") -- remove the lua extension from file
  module_path = module_path:gsub("/", ".") -- change "/" to "." to match module naming
  return module_path
end

--- setup function to control the behavior of this module
--- @param opts? loader.opts
M.setup = function(opts)
  opts = opts or { ignore = {} }
  ignore_patterns = opts.ignore
  for module_path, type in vim.fs.dir(base_path, { depth = 10 }) do
    if type == "directory" then
      goto continue
    end

    local module = convert_path_to_module(module_path)
    local ignored = should_ignore(module)

    if ignored then
      table.insert(ignored_modules, module)
      goto continue
    end

    table.insert(loaded_modules, module)
    require(module)

    ::continue::
  end
end

vim.api.nvim_create_user_command("Modules", function(opts)
  local handlers = {
    ignored = {
      value = table.concat(ignored_modules, "\n- "),
      title = "Ignored Modules",
    },
    loaded = {
      value = table.concat(loaded_modules, "\n- "),
      title = "Loaded Modules",
    },
  }

  local list = handlers[opts.args]
  if not list then
    vim.notify("Invalid Argument: " .. opts.args, "error", {})
  end

  vim.notify("- " .. list.value, "info", { title = list.title })
end, {
  nargs = 1,
  complete = function(_, cmdline)
    if #vim.split(cmdline, "%s+") > 2 then
      return {}
    end
    return { "loaded", "ignored" }
  end,
})

return M
