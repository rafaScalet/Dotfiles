return {
  { "brenoprata10/nvim-highlight-colors", opts = {}, event = { "BufReadPre", "BufNewFile" } },
  { "chaoren/vim-wordmotion" },
  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
  },
}
