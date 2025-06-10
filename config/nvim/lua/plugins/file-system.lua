return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  config = function()
    require("oil").setup({
      view_options = {
        case_insensitive = true,
        show_hidden = true,
      },
    })
  end,
  keys = { { "-", ":Oil --float<CR>", desc = "Open up Oil.nvim in float mode" } },
  lazy = false,
}
