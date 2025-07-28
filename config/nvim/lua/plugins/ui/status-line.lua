return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local custom_theme = require("lualine.themes.auto")

    custom_theme.normal.c.bg = ""
    custom_theme.inactive.c.bg = ""
    custom_theme.normal.b.bg = ""
    custom_theme.insert.b.bg = ""
    custom_theme.visual.b.bg = ""
    custom_theme.command.b.bg = ""
    custom_theme.terminal.b.bg = ""
    custom_theme.replace.b.bg = ""
    custom_theme.inactive.b.bg = ""

    local function recording()
      local reg = vim.fn.reg_recording()

      if reg ~= "" then
        return "Recording @" .. reg
      else
        return ""
      end
    end

    require("lualine").setup({
      options = {
        theme = custom_theme,
        component_separators = "",
        section_separators = "",
        disabled_filetypes = { "snacks_dashboard", "trouble", "dbee" },
        always_divide_middle = false,
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "", right = "" } } },
        lualine_b = { { recording } },
        lualine_c = {
          "%=",
          {
            "diff",
            symbols = {
              added = I.git.status.added,
              modified = I.git.status.modified,
              removed = I.git.status.removed,
            },
          },
          {
            "diagnostics",
            symbols = {
              error = I.lsp.diagnostics.error,
              warn = I.lsp.diagnostics.warn,
              info = I.lsp.diagnostics.info,
              hint = I.lsp.diagnostics.hint,
            },
          },
        },
        lualine_x = {},
        lualine_y = { { "branch", icon = I.git.branch } },
        lualine_z = {
          { "filename", separator = { right = "", left = "" }, symbols = { modified = "", readonly = "" } },
        },
      },
    })
  end,
}
