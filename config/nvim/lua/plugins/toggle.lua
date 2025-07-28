return {
  {
    "johmsalas/text-case.nvim",
    opts = {},
    keys = { "ga" },
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
      { "<C-a>", "<cmd>Boole increment<cr>", desc = "Increment" },
      { "<C-x>", "<cmd>Boole decrement<cr>", desc = "Decrement" },
    },
  },
}
