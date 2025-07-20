return {
  { "brenoprata10/nvim-highlight-colors", opts = {}, event = { "BufReadPre", "BufNewFile" } },
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
  { "chaoren/vim-wordmotion" },
  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "nvzone/showkeys",
    config = function()
      require("showkeys").setup({
        timeout = 1,
        maxkeys = 5,
      })
      require("showkeys").open()
    end,
  },
}
