return {
  { "brenoprata10/nvim-highlight-colors", opts = {} },
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
  { "gregorias/coerce.nvim", opts = {}, dependencies = { "gregorias/coop.nvim" } },
  { "chaoren/vim-wordmotion" },
  {
    "nat-418/boole.nvim",
    opts = {
      mappings = {
        increment = "<C-a>",
        decrement = "<C-x>",
      },
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
