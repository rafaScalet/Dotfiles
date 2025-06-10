return {
  { "brenoprata10/nvim-highlight-colors", opts = {} },
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}
