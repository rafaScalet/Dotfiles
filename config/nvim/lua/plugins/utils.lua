return {
  { "brenoprata10/nvim-highlight-colors", opts = {} },
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
  { "nvzone/minty", cmd = { "Shades", "Huefy" }, dependencies = { "nvzone/volt" } },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
    },
  },
  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    lazy = false,
    config = function()
      require("showkeys").setup({
        timeout = 1,
        maxkeys = 5,
      })
      require("showkeys").open()
    end,
  },
  {
    "VonHeikemen/searchbox.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    keys = {
      { "<C-f>", "<CMD>SearchBoxMatchAll<CR>", desc = "Search" },
      { "<C-d>", "<CMD>SearchBoxReplace<CR>", desc = "Replace" },
    },
  },
}
