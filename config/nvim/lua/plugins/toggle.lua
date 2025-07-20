return {
  {
    "gregorias/coerce.nvim",
    opts = {},
    dependencies = { "gregorias/coop.nvim" },
  },
  {
    "nat-418/boole.nvim",
    opts = {
      mappings = {
        increment = "<C-a>",
        decrement = "<C-x>",
      },
    },
    keys = {
      { "<C-a>", "<cmd>Boole increment<cr>" },
      { "<C-x>", "<cmd>Boole decrement<cr>" },
    },
  },
}
