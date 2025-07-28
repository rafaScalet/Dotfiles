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
      { "<leader>gd", group = "Diff" },
      { "<leader>gb", group = "Blame" },

      -- LSP
      { "<leader>l", group = "LSP" },
      { "<leader>ld", group = "Diagnostic" },
      { "<leader>lg", group = "Go To" },
      { "<leader>lc", group = "Code" },

      -- Code
      { "<leader>c", group = "Code" },
      { "<leader>cs", group = "Swap" },
      { "<leader>ca", group = "Text Case" },
      { "<leader>cal", group = "LSP Rename" },
      { "<leader>caw", group = "Current Word Rename" },
      { "<leader>cc", group = "Comment" },
      { "<leader>cm", group = "Surround" },

      -- Utils
      { "<leader>b", group = "Buffer" },
      { "<leader>F", group = "Flash" },

      -- Find (Snacks.nvim)
      { "<leader>f", group = "Find" },
      { "<leader>fg", group = "Git" },
      { "<leader>fd", group = "Diagnostic" },
      { "<leader>fda", group = "All" },
      { "<leader>fdb", group = "Buffers" },
      { "<leader>fc", group = "Commands" },
      { "<leader>fs", group = "Grep" },
      { "<leader>fl", group = "Lsp" },

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
