local lualine = require("lualine")
local icons = require("utils.icons")
local navic = require("nvim-navic")

navic.setup({
  lsp = { auto_attach = true },
  icons = icons.lsp.kind,
})

local custom_theme = require("lualine.themes.catppuccin-mocha")

custom_theme.normal.b.bg = ""
custom_theme.normal.c.bg = ""
custom_theme.inactive.b.bg = ""
custom_theme.inactive.c.bg = ""
custom_theme.insert.b.bg = ""
custom_theme.visual.b.bg = ""
custom_theme.command.b.bg = ""
custom_theme.terminal.b.bg = ""
custom_theme.replace.b.bg = ""

local function recording()
  local reg = vim.fn.reg_recording()

  if reg ~= "" then
    return "@" .. reg
  else
    return ""
  end
end

lualine.setup({
  options = {
    theme = custom_theme,
    component_separators = "",
    section_separators = "",
    always_divide_middle = false,
  },
  sections = {
    lualine_a = {},
    lualine_b = {
      { "mode", icon = icons.terminal },
      { recording, icon = icons.play },
      {
        function()
          return require("nvim-navic").get_location()
        end,
        cond = function()
          return require("nvim-navic").is_available()
        end,
      },
    },
    lualine_c = {
      "%=",
      {
        "diff",
        symbols = {
          added = icons.git.status.added,
          modified = icons.git.status.modified,
          removed = icons.git.status.removed,
        },
      },
      {
        "diagnostics",
        symbols = {
          error = icons.lsp.diagnostics.error,
          warn = icons.lsp.diagnostics.warn,
          info = icons.lsp.diagnostics.info,
          hint = icons.lsp.diagnostics.hint,
        },
      },
    },
    lualine_x = {},
    lualine_y = {
      { "branch", icon = icons.git.branch },
      {
        "filename",
        symbols = { modified = icons.fs.file.modified, readonly = icons.fs.file.readonly },
        icon = icons.fs.file.i,
      },
    },
    lualine_z = {},
  },
})
