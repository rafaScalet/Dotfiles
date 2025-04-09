return {
  {
    "echasnovski/mini.pairs",
    version = false,
    opts = {},
  },
  {
    "echasnovski/mini.comment",
    version = false,
    opts = {},
  },
  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    opts = { maxkeys = 5 },
    keys = { { "<leader>sk", ":ShowkeysToggle<CR>", desc = "Toogle Showkeys" } },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  { "tpope/vim-sleuth" },
}
