local M = {}

M.setup = function(opts)
  opts = opts or {}
  local ignore = opts.ignore or {}

  local function should_ignore(module)
    for _, pattern in ipairs(ignore) do
      if module:match(pattern) then
        return true
      end
    end
    return false
  end

  local function scan(dir)
    dir = dir or ""
    local base = vim.fn.stdpath("config") .. "/lua/" .. dir

    for _, path in ipairs(vim.fn.glob(base .. "/*", true, true)) do
      local name = path:match("([^/]+)$")

      if vim.fn.isdirectory(path) == 1 then
        scan(dir .. "/" .. name)
      elseif name:match("%.lua$") and name ~= "init.lua" then
        local module = path:gsub(".*/lua/", ""):gsub("%.lua$", ""):gsub("/", ".")

        if not should_ignore(module) then
          require(module)
        end
      end
    end
  end

  scan("")
end

return M
