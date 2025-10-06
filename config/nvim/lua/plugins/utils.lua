return {
  { "brenoprata10/nvim-highlight-colors", opts = {}, event = { "BufReadPre", "BufNewFile" } },
  { "chaoren/vim-wordmotion" },
  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },
  { "nmac427/guess-indent.nvim", opts = {} },
  { "kawre/neotab.nvim", event = "InsertEnter", opts = {} },
  {
    "jiaoshijie/undotree",
    keys = { { "<leader>cu", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undotree" } },
  },
}
