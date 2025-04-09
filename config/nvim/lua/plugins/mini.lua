return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.ai").setup({})
    require("mini.comment").setup({})
    require("mini.operators").setup({})
    require("mini.pairs").setup({})
    require("mini.surround").setup({})
    require("mini.bracketed").setup({})
    require("mini.icons").setup({})
    require("mini.statusline").setup({})
    require("mini.tabline").setup({})
  end,
}
