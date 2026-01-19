local wk = require("which-key")

local leader = " "
local local_leader = "\\"

local M = {}

wk.setup({
  preset = "modern",
  icons = { mappings = false },
  spec = {
    { leader, group = "Leader", mode = { "n", "v", "x" } },
    { local_leader, group = "Toggle", mode = { "n", "v", "x" } },
    { "<C-w>", group = "Window" },
    { "z", group = "Fold" },
    { "g", group = "Global" },
    { '"', group = "Registers" },
    { "'", group = "Marks" },
    { "`", group = "Marks" },
    { "]", group = "Next" },
    { "[", group = "Prev" },
  },
})

vim.keymap.set("n", "?", function()
  wk.show({ global = true })
end, { desc = "Which Key" })

vim.g.mapleader = leader
vim.g.maplocalleader = local_leader

--- @param specs keymaps.spec[]
--- @param opts? keymaps.opts
M.add = function(specs, opts)
  opts = opts or {}

  local prefix = opts.prefix or ""
  local mode = opts.mode or "n"
  local group = opts.group or ""

  local desc_opts = opts.desc or {}
  local desc_prefix = desc_opts.prefix or ""
  local desc_suffix = desc_opts.suffix or ""

  local cmd_wrapper = opts.cmd_wrapper
    ---@param value keymaps.rhs
    or function(value)
      if type(value) == "table" then
        error("Can't be a object without cmd_wrapper", 2)
      end
      return value
    end

  wk.add({ { prefix, group = group, mode = mode } })

  for _, spec in ipairs(specs) do
    local lhs = prefix .. spec[1]
    local rhs = cmd_wrapper(spec[2])
    local desc = spec[3]
    mode = spec.mode or mode

    vim.keymap.set(mode, lhs, rhs, {
      desc = desc_prefix .. desc .. desc_suffix,
    })
  end
end

---@param mappings wk.Spec
M.wk = function(mappings)
  wk.add(mappings)
end

return M
