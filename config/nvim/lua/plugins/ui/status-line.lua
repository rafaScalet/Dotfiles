return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local custom_theme = require("lualine.themes.auto")

    local lazy_status = require("lazy.status")

    custom_theme.normal.c.bg = ""
    custom_theme.inactive.c.bg = ""

    require("lualine").setup({
      options = {
        theme = custom_theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "snacks_dashboard", "trouble", "dbee" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = " ", right = "" }, right_padding = 2 } },
        lualine_b = {
          {
            "buffers",
            use_mode_colors = true,
            hide_filename_extension = true,
            max_length = vim.o.columns * 1 / 2,
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
              error = icons.lsp.error,
              warn = icons.lsp.warn,
              info = icons.lsp.info,
              hint = icons.lsp.hint,
            },
          },
        },
        lualine_x = {},
        lualine_y = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          {
            "filetype",
            colored = false,
          },
          {
            "branch",
            icon = icons.git.branch,
          },
        },
        lualine_z = { { "location", separator = { right = " ", left = "" } } },
      },
    })
  end,
}
