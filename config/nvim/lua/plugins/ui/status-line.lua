return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local custom_theme = require("lualine.themes.catppuccin")

    local icons = require("icons").spaced

    custom_theme.normal.c.bg = ""
    custom_theme.inactive.c.bg = ""

    require("lualine").setup({
      options = {
        theme = custom_theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "snacks_dashboard" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
        lualine_b = {
          {
            "buffers",
            use_mode_colors = true,
            hide_filename_extension = true,
            max_length = vim.o.columns * 1 / 3,
          },
        },
        lualine_c = {
          "%=",
          {
            "diff",
            -- icon = "Git:",
            symbols = {
              added = icons.git_status_added,
              modified = icons.git_status_modified,
              removed = icons.git_status_removed,
            },
          },
          {
            "diagnostics",
            -- icon = "LSP:",
            symbols = {
              error = icons.error,
              warn = icons.warn,
              info = icons.info,
              hint = icons.hint,
            },
          },
        },
        lualine_x = {},
        lualine_y = {
          {
            "filetype",
            colored = false,
          },
          {
            "branch",
            icon = icons.git_branch,
          },
        },
        lualine_z = { { "location", separator = { right = "", left = "" } } },
      },
    })
  end,
}
