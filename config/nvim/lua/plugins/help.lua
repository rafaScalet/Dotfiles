return {
  "folke/which-key.nvim",
  enabled = true,
  event = "VeryLazy",
  keys = { { "<leader>?", "<cmd>WhichKey<cr>", desc = "Which Key" } },
  opts = {
    preset = "helix",
    icons = { mappings = false },
    spec = {
      { "<leader>", group = "Leader" },
      -- Git
      { "<leader>g", group = "Git" },
      { "<leader>gh", group = "Hunk" },

      -- LSP
      { "<leader>l", group = "LSP" },
      { "<leader>ld", group = "Diagnostic" },
      { "<leader>lg", group = "Go To" },

      -- Mini
      { "<leader>m", group = "Mini" },
      { "<leader>ms", group = "Surround" },
      { "<leader>mc", group = "Comment" },
      { "<leader>mf", group = "Files" },

      -- Utils
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Comment" },
      { "<leader>C", group = "Code" },
      { "<leader>f", group = "Find" },
      { "<leader>F", group = "Flash" },
      { "<leader>S", group = "Swap" },

      -- Defaults
      { '"', group = "Registers" },
      { "`", group = "Marks" },
      { "'", group = "Marks" },
      { "g", group = "Go To" },
      { "z", group = "Fold" },
      { "[", group = "Go To Prev" },
      { "]", group = "Go To Next" },
      { "<C-w>", group = "Windows" },

      -- Toggles
      { "<localLeader>", group = "Toggles" },
      { "<localLeader>g", group = "Git" },
      { "<localLeader>D", group = "Diagnostic" },
    },
  },
}
