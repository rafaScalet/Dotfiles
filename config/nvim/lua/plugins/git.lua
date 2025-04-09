return {
  {
    "tpope/vim-fugitive",
    keys = { { "<leader>gg", ":Git ", desc = "invoke vim fugitive (git command)" } },
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = {},
    keys = {
      {
        "<leader>gp",
        ":Gitsigns preview_hunk<CR>",
        desc = "Preview Git Hunk",
      },
      {
        "<leader>gb",
        ":Gitsigns toggle_current_line_blame<CR>",
        desc = "Toggle Git Blame",
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
  },
}
