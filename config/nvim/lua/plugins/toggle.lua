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
      { "<C-a>", "<cmd>Boole increment<cr>" },
      { "<C-x>", "<cmd>Boole decrement<cr>" },
    },
  },
  {
    "gregorias/coerce.nvim",
    opts = {},
    enabled = false,
    dependencies = { "gregorias/coop.nvim" },
    keys = { "cr" },
  },
}
