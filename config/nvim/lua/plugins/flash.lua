return {
  "folke/flash.nvim",
  enabled = true,
  event = { "VeryLazy" },
  ---@type Flash.Config
  opts = {
    modes = {
      search = { enabled = true },
      char = { jump_labels = true },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>Fs", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<leader>FS", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "<leader>Fr", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "<leader>FR", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<localLeader>f", function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
